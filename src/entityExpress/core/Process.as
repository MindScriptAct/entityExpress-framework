package entityExpress.core {
import entityExpress.*;

public class Process {

	private var allTasks:Vector.<Task> = new <Task>[];

	private var engine:Engine;

	public function Process() {
	}

	public function onInit():void {

	}

	internal function init(engine:Engine):void {
		this.engine = engine;
		onInit();
	}

	internal function run():void {
		for (var i:int = 0; i < allTasks.length; i++) {
			var task:Task = allTasks[i];

			task.execute();

			if (task.runCount != -1) {
				task.runCount--;
				if (task.runCount <= 0) {
					allTasks.splice(i, 1);
					i--
				}
			}
		}
	}

	protected function addTask(taskClass:Class, runCount:int = -1):void {
		var task:Task = new taskClass();
		task.runCount = runCount;
		task.init(engine);

		allTasks.push(task);
	}
}
}
