package simpleSample.tasks {
import entityExpress.core.Task;

import flash.display.Stage;

public class MyTask extends Task {

	[Inject]
	public var stage:Stage;

	override public function execute():void {
		trace("Do stuff!");
	}


}
}
