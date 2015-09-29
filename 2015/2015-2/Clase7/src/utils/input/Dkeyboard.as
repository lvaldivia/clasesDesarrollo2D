package utils.input 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Dkeyboard 
	{
		static private var stage:Stage;
		static public var left:Boolean;
		static public var right:Boolean;
		static public var Down:Boolean;
		static public var Up:Boolean;
		static public var Mata:Boolean;
		public static var space:Boolean;
		
		public static function init(_stage:Stage):void
		{
		  stage = _stage;
		  stage.focus = stage;
		  stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		  stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		  
		}
		
		static private function onKeyUp(e:KeyboardEvent):void 
		{
			switch (e.keyCode)
			{
			 case Keyboard.LEFT: left = false;
			 break
			 case Keyboard.RIGHT: right = false;
			 break;
			 case Keyboard.UP : Up = false;
			 break;
			 case Keyboard.DOWN: Down = false;
			 break;
			 case Keyboard.SPACE:
				 space = false;
			 break;
			 
			}
		}
		
		static private function onKeyDown(e:KeyboardEvent):void 
		{
			switch (e.keyCode)
			{
			 case Keyboard.LEFT: left = true;
			 break
			 case Keyboard.RIGHT: right = true;
			 break;
			 case Keyboard.UP : Up = true;
			 break;
			 case Keyboard.DOWN: Down = true;
			 break;
			 case Keyboard.SPACE: space = true;
			 break;
			}
		}
		static public function clean():void {
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
		
		}
		
	}

}