package listPerformanceTesting.components {
import flash.utils.Dictionary;

public class TestEntityBase implements ITestEntityBase {

	public var next:TestEntityBase;

	public var nextUntyped:*;

	private var classRegistry:Dictionary = new Dictionary();

	public function TestEntityBase() {
	}

	public function getNext():ITestEntityBase {
		return next;
	}

	public function getNextUntyped():* {
		return nextUntyped;
	}

	public function getNextByClass(entityClass:Class):* {
		return classRegistry[entityClass];
	}

	public function setNextByClass(entityClass:Class, entytObj:*):void {
		classRegistry[entityClass] = entytObj;
	}
}
}
