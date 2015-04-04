package simpleSample.tasks {
import entityExpress.core.Task;

import flash.display.Stage;

import simpleSample.entity.MyTestEntity;

public class MyTaskOnce extends Task {

	[Inject]
	public var stage:Stage;

	override public function execute():void {
		trace("create!");

		var entity:MyTestEntity = createEntity(MyTestEntity);

		//stage.addChild(entity.view.object);

		// must make it impossible somehow..
		entity.view.object.x = 50;
		entity.view.object.y = 50;

	}


}
}
