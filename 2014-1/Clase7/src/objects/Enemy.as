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
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.graphics.beginFill(0x00FF00);
			this.graphics.drawCircle(0, 0, 50);
			this.graphics.endFill();
			x = stage.stageWidth;
			y = stage.stageHeight - 150;
		}
		
		public function mover():void 
		{
			x -= 10;
		}
		
	}

}