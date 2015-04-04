package simpleSample {
import flash.display.Sprite;

public class QuickTest {
	public function QuickTest() {
	}

	public function getUndefined():* {
		return cheateSprite();
	}

	public function getDefined():Sprite {
		return cheateSprite();
	}


	public function cheateSprite():Sprite {
		return new QuickTestObject();
	}
}
}
