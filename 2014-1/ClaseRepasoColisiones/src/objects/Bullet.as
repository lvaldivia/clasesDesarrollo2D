package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Bullet extends Sprite
	{
		
		public function Bullet() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			graphics.beginFill(0xFFFFFF);
			graphics.drawRect(0, 0, 50, 50);
			graphics.endFill();
		}
		
	}

}