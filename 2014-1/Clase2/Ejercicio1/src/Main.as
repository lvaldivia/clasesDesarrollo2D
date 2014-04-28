package src
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			for (var i:int = 0; i < 5; i++) 
			{
				var triangle:Sprite = new Sprite();
				triangle.addEventListener(MouseEvent.CLICK, clickTriangle);
				if (i % 2 == 0) {
					triangle.graphics.beginFill(0x999900);
				}else {
					triangle.graphics.beginFill(0x4D4D4D);
				}
				triangle.graphics.moveTo(0, 0);
				triangle.graphics.lineTo(0, 100);
				triangle.graphics.lineTo(100, 100);
				triangle.graphics.lineTo(0, 0);
				triangle.graphics.endFill();
				triangle.x = (i * (triangle.width + 10));
				triangle.buttonMode = true;
				addChild(triangle);
			}
			
		}
		
		private function clickTriangle(e:MouseEvent):void 
		{
			trace("hola");
		}
		
	}
	
}