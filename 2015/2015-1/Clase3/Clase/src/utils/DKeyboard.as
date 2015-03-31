package utils 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author 
	 */
	public class DKeyboard 
	{
		static private var stage:Stage;
		static public var downPress:Boolean;
		static public var upPress:Boolean;
		static public var leftPress:Boolean;
		static public var rightPress:Boolean;
		static public var spacePress:Boolean;
		
		static public function init(_stage:Stage):void {
			stage = _stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, down);
			stage.addEventListener(KeyboardEvent.KEY_UP, up);
		}
		
		static private function up(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					leftPress = false;
				break;
				case Keyboard.RIGHT:
					rightPress = false;
				break; 
				case Keyboard.DOWN:
					downPress = false;
				break;
				case Keyboard.UP:
					upPress = false;
				break;
				case Keyboard.SPACE:
					spacePress = false;
				break;
			}
		}
		
		static private function down(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					leftPress = true;
				break;
				case Keyboard.RIGHT:
					rightPress = true;
				break; 
				case Keyboard.DOWN:
					downPress = true;
				break;
				case Keyboard.UP:
					upPress = true;
				break;
				case Keyboard.SPACE:
					spacePress = true;
				break;
			}
		}
		
		static public function clear():void {
			if (stage.hasEventListener(KeyboardEvent.KEY_DOWN)) {
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, down);
			}
			if (stage.hasEventListener(KeyboardEvent.KEY_UP)) {
				stage.removeEventListener(KeyboardEvent.KEY_UP, up);
			}
		}
		
	}

}