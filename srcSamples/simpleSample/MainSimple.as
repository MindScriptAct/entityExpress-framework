package simpleSample {
import entityExpress.core.Engine;

import flash.display.Sprite;
import flash.text.TextField;

import simpleSample.entity.MyTestEntity;
import simpleSample.processes.FrameProcess;

public class MainSimple extends Sprite {
	public function MainSimple() {


		var textField:TextField = new TextField();
		textField.text = "Hello, World";
		addChild(textField);


		var myEngine:Engine = new Engine();
		this.addChild(myEngine);

		myEngine.registerEntity(MyTestEntity);

		//myEngine.addTimerProcess(FrameProcess, 50);
		myEngine.addFrameProcess(FrameProcess);

		myEngine.start();


	}


}
}
