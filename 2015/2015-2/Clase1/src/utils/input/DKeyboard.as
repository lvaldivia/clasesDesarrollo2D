package utils.input 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DKeyboard 
	{
		private static var stage:Stage;
		static public var left:Boolean;
		static public var right:Boolean;
		public static function init(_stage:Stage):void {
			stage = _stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		static public function clean():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		static private function onKeyUp(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = false;
				break;
				case Keyboard.RIGHT:
					right = false;
				break;
			}
		}
		
		static private function onKeyDown(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = true;
				break;
				case Keyboard.RIGHT:
					right = true;
				break;
			}
		}
		
	}

}