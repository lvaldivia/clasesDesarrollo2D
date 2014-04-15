package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Home extends Sprite
	{
		private var bg:Sprite;
		private var botones:MovieClip;
		
		public function Home() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE, removeStage);
		}
		
		private function removeStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removeStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			bg = new fondo();
			addChild(bg);
			botones = new menu();
			addChild(botones);
		}
		
	}

}