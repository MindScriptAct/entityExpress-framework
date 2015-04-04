package listPerformanceTesting {
import flash.display.Sprite;

import listPerformanceTesting.entityLists.EntityX;
import listPerformanceTesting.entityLists.EntityY;
import listPerformanceTesting.entityLists.EntityZ;
import listPerformanceTesting.entityLists.IEntityA;
import listPerformanceTesting.entityLists.IEntityB;
import listPerformanceTesting.entityLists.IEntityC;

public class EntityListTestMain extends Sprite {

	private var allEntityX:EntityX;

	private var allEntityY:EntityY;

	private var allEntityZ:EntityZ;

	private var allEntityA:IEntityA;

	private var allEntityB:IEntityB;

	private var allEntityC:IEntityC;


	public function EntityListTestMain() {

		createX();
		createY();
		createZ();

		for (var testObj:EntityX = allEntityX; testObj; testObj = testObj.getNext()) {
			testObj.doAthing();
		}

		for (var testObj:IEntityA = allEntityA; testObj; testObj = testObj.getNext()) {
			testObj.doAthing();
		}


		for (var curentListItem:EntityListItem = listHead, curentListItem; curentListItem = curentListItem.nextItem()) {
			testObj = curentListItem.entity;

		}

	}

	private function createX():void {

	}

	private function createY():void {

	}

	private function createZ():void {

	}


}
}
