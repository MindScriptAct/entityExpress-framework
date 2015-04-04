package listPerformanceTesting.components {
public class TestEntity extends TestEntityBase implements ITestEntityTestable, ITestEntityTracable {

	public var id:int;

	private static var COUNT:int = 0;

	public function TestEntity():void {
		id = COUNT++;
	}


	public function doTrace():void {
		trace("doTrace");
	}

	public function doTest():void {
		//trace("doTest");
	}
}
}
