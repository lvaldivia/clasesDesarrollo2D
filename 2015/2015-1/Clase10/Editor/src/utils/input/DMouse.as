package utils.input 
{
	import flash.display.Stage;	
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author 
	 */
	public class DMouse 
	{
		static public var isDown:Boolean;
		static public var x:Number;
		static public var y:Number;
		static private var stage:Stage;
		
		static public function init(_stage:Stage):void {
			stage = _stage;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
		}
		
		static private function onMove(e:MouseEvent):void 
		{
			x = stage.mouseX;
			y = stage.mouseY;
		}
		
		static private function onDown(e:MouseEvent):void 
		{
			isDown = true;
		}
		
		static public function reset():void {
			isDown = false;
		}
		
		static public function destroy():void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMove);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, onDown);
			isDown = false;
			x = y = 0;
		}
		
	}

}