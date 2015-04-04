package entityExpress.components.flash.view {
import entityExpress.core.Component;

import flash.display.Sprite;

public class SpriteComponent extends Component {

	public var object:Sprite = new Sprite();

	public function SpriteComponent():void {
		// TODO: remove...
		object.graphics.lineStyle(3, 0xFFFF00);
		object.graphics.beginFill(0x00FFFF);
		object.graphics.drawCircle(0, 0, 50);
		object.graphics.endFill();
	}


}
}
