package entityExpress.core {
import entityExpress.*;
import entityExpress.vos.ComponentInjectRuleVO;

import flash.display.Sprite;
import flash.events.Event;
import flash.system.System;
import flash.utils.Dictionary;
import flash.utils.describeType;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;

public class Engine extends Sprite {


	private var frameProcesses:Vector.<Process> = new <Process>[];
	private var qualifiedClassNameRegistry:Dictionary = new Dictionary();
	private var classComponentInjectRules:Dictionary = new Dictionary();

	private var isRunning:Boolean = false;

	public function Engine() {
	}


	public function start():void {
		isRunning = true;
		if (frameProcesses.length) {
			this.stage.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
		}
	}

	public function stop():void {
		isRunning = false;
		if (frameProcesses.length) {
			this.stage.removeEventListener(Event.ENTER_FRAME, handleEnterFrame);
		}
	}


	private function handleEnterFrame(event:Event):void {
		for (var i:int = 0; i < frameProcesses.length; i++) {
			var process:Process = frameProcesses[i];

			process.run();
		}
	}

	public function addTimerProcess(processClass:Class, ms:int):void {
		// check process class

	}

	//TODO: implement frameSkip...
	public function addFrameProcess(processClass:Class, frameSkip:int = 0):void {
		// check process class
		var myProcess:Process = new processClass();
		myProcess.init(this);

		frameProcesses.push(myProcess);

		if (isRunning) {
			if (frameProcesses.length) {
				this.stage.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
			}
		}
	}

	public function removeProcess():void {
		throw Error("TODO:implement");
	}

	public function registerEntity(entityClass:Class):void {
		// check if extended entity class.
		var className:String = qualifiedClassNameRegistry[entityClass];
		if (!className) {
			className = getQualifiedClassName(entityClass);
			qualifiedClassNameRegistry[entityClass] = className;
			var rules:Vector.<ComponentInjectRuleVO> = parseComponentInjectRules(entityClass);
			classComponentInjectRules[entityClass] = rules;
		}
	}

	private function parseComponentInjectRules(entityClass:Class):Vector.<ComponentInjectRuleVO> {
		var retVal:Vector.<ComponentInjectRuleVO> = new <ComponentInjectRuleVO>[];

		var classDescription:XML = describeType(entityClass);

		var factoryNodes:XMLList = classDescription.factory.*;

		var nodeCount:int = factoryNodes.length();
		for (var i:int; i < nodeCount; i++) {
			var node:XML = factoryNodes[i];
			var nodeName:String = node.name();
			if (nodeName == "variable" || nodeName == "accessor") {
				retVal[retVal.length] = getInjectRule(node.@name.toString(), node.@type.toString())
			}
		}
		System.disposeXML(classDescription);
		return retVal;
	}

	protected function getInjectRule(varName:String, injectClassDefinitionName:String):ComponentInjectRuleVO {
		var mapRule:ComponentInjectRuleVO = new ComponentInjectRuleVO();
		mapRule.varName = varName;
		mapRule.injectId = injectClassDefinitionName;
		mapRule.injectClass = getDefinitionByName(injectClassDefinitionName) as Class;
		return mapRule;
	}

	internal function createEntity(entityClass:Class):Entity {
		var rules:Vector.<ComponentInjectRuleVO> = classComponentInjectRules[entityClass];
		if (rules == null) {
			throw Error("Entity class is not registered.");
		}

		//TODO:Entity pooling.
		//TODO:IEntity
		var entity:Entity = new entityClass();

		for (var i:int = 0; i < rules.length; i++) {
			var rule:ComponentInjectRuleVO = rules[i];

			//TODO: Component pooling.
			entity[rule.varName] = new rule.injectClass();
		}

		//entity.onCreate();

		return entity;
	}
}
}
