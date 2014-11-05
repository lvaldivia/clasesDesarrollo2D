package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Enemy extends Sprite
	{
		
		public function Enemy() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			graphics.beginFill(0xFFF000);
			graphics.drawRect(0, 0, 50, 50);
			graphics.endFill();
		}
		
		public function move():void {
			x -= 2;
		}
		
	}

}