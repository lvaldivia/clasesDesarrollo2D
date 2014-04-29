package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Montanas extends Sprite
	{
		private var bg:Sprite;
		private var index:int;
		
		public function Montanas(i:int) 
		{
			super();
			index = i;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			bg = new capa2();
			bg.x = index*bg.width;
			bg.y = stage.stageHeight-300;
			addChild(bg);
		}
		
		public function mover():void {
			bg.x -= 10;
			if (bg.x <= -bg.width) {
				bg.x = stage.stageWidth;
			}
		}
		
	}

}