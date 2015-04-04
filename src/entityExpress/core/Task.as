package entityExpress.core {
public class Task {

	private var engine:Engine;

	// internal
	internal var runCount:int;

	public function Task() {
	}

	internal function init(engine:Engine):void {
		this.engine = engine;

		// inject task stuff..
		//engine.initTask(this);
	}

	public function execute():void {
		throw Error("Override.");
	}

	protected function createEntity(entityClass:Class):* {
		return engine.createEntity(entityClass);
	}
}
}
