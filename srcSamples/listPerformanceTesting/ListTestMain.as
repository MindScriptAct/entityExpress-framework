package listPerformanceTesting {
import flash.display.Sprite;
import flash.utils.getTimer;
import flash.utils.setTimeout;

import listPerformanceTesting.components.ITestEntityBase;
import listPerformanceTesting.components.ITestEntityTestable;
import listPerformanceTesting.components.ITestEntityTracable;
import listPerformanceTesting.components.TestEntity;
import listPerformanceTesting.components.TestEntityBase;

public class ListTestMain extends Sprite {

	private const ARR_SIZE:int = 1000;

	private const TEST_COUNT:int = 10000;

	private var listHead:TestEntity;
	private var listIntHead:ITestEntityBase;
	private var listIntTestableHead:ITestEntityTestable;

	private var listArr:Vector.<TestEntity> = new <TestEntity>[];
	private var listIntArr:Vector.<ITestEntityBase> = new <ITestEntityBase>[];
	private var listIntTestableArr:Vector.<ITestEntityTestable> = new <ITestEntityTestable>[];

	public function ListTestMain() {

		var newObj:TestEntity = new TestEntity();
		listHead = newObj;
		listIntHead = newObj;
		listIntTestableHead = newObj;

		var lastObj:TestEntity = newObj;

		listArr.push(newObj);
		listIntArr.push(newObj);
		listIntTestableArr.push(newObj);

		for (var i:int; i < ARR_SIZE; i++) {
			newObj = new TestEntity();

			lastObj.next = newObj;
			lastObj.nextUntyped = newObj;

			lastObj.setNextByClass(TestEntity, newObj);
			lastObj.setNextByClass(ITestEntityTestable, newObj);
			lastObj.setNextByClass(ITestEntityTracable, newObj);

			lastObj = newObj;

			listArr.push(newObj);
			listIntArr.push(newObj);
			listIntTestableArr.push(newObj);


		}
		//doTestX2();

		setTimeout(doTest1, 2000);
	}

	private function doTest1():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var i:int = 0; i < listArr.length; i++) {
				var data:int = listArr[i].id;
			}

			////////////////////////////////////////
		}
		trace("vector base:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest2, 500);

	}

	private function doTest2():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var testObj:TestEntity = listHead; testObj; testObj = testObj.getNextUntyped()) {
				var data:int = testObj.id;
			}

			////////////////////////////////////////
		}
		trace("list with function:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest3, 500);

	}

	private function doTest3():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var testObj:TestEntity = listHead; testObj; testObj = testObj.nextUntyped) {
				var data:int = testObj.id;
			}

			////////////////////////////////////////
		}
		trace("list in var:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest4, 500);
	}


	private function doTest4():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var i:int = 0; i < listIntTestableArr.length; i++) {
				listIntTestableArr[i].doTest();
			}

			////////////////////////////////////////
		}
		trace("vector base interfce:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest5, 500);

	}

	private function doTest5():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var testObj:ITestEntityTestable = listIntTestableHead; testObj; testObj = testObj.getNextUntyped()) {
				testObj.doTest();
			}

			////////////////////////////////////////
		}
		trace("list with function interface:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest6, 500);

	}

	private function doTest6():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var testObj:ITestEntityTestable = listHead; testObj; testObj = (testObj as TestEntityBase).nextUntyped) {
				testObj.doTest();
			}

			////////////////////////////////////////
		}
		trace("list in var interface:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest7, 500);
	}

	private function doTest7():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var testObj:TestEntity = listHead; testObj; testObj = testObj.getNextByClass(TestEntity)) {
				testObj.doTest();
			}

			////////////////////////////////////////
		}
		trace("entyty by class:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest8, 500);

	}

	private function doTest8():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			for (var testObj:ITestEntityTestable = listIntTestableHead; testObj; testObj = testObj.getNextByClass(ITestEntityTestable)) {
				testObj.doTest();
			}

			////////////////////////////////////////
		}
		trace("entity interface by class:" + (getTimer() - timer));
		////////////////////////////////////////////

		//setTimeout(doTest4, 500);
	}


	//////////////////////////
	//////////////////////////
	//////////////////////////
	//////////////////////////

	private function doTest():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////


			////////////////////////////////////////
		}
		trace("" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest4, 500);
	}


	//private function doTestX():void {
	//
	//	var testObj:TestEntity = listHead;
	//	if (testObj) {
	//		do {
	//			trace(testObj.id);
	//		} while (testObj = testObj.nextUntyped);
	//	}
	//}

	private function doTestX2():void {

		for (var testObj:TestEntity = listHead; testObj; testObj = testObj.nextUntyped) {
			trace(testObj.id);
		}
	}

	private function doTestXX2():void {
		////////////////////////////////////////////
		var timer:int = getTimer();
		for (var t:int; t < TEST_COUNT; t++) {
			////////////////////////////////////////

			var testObj:TestEntity = listHead;
			while (testObj) {
				var data:int = testObj.id;
				testObj = testObj.nextUntyped;
			}

			////////////////////////////////////////
		}
		trace("list in while:" + (getTimer() - timer));
		////////////////////////////////////////////

		setTimeout(doTest3, 500);

	}

}
}
