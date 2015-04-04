package simpleSample.processes {
import entityExpress.core.Process;

import simpleSample.tasks.MyTask;
import simpleSample.tasks.MyTaskOnce;

public class FrameProcess extends Process {


	override public function onInit():void {
		addTask(MyTaskOnce, 1);
		addTask(MyTask);
	}


}
}
