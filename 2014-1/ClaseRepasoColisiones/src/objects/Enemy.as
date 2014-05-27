package src.objects 
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
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			graphics.beginFill(0xFFFF00);
			graphics.drawRect(0, 0, 50, 50);
			graphics.endFill();
		}
		
	}

}