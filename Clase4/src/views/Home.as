package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.events.NavigationEvent;
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
			botones.btnJugar.addEventListener(MouseEvent.CLICK, downJugar);
			botones.btnJugar.buttonMode = true;
		}
		
		private function downJugar(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, { view:'instrucciones' }, true));
		}
		
	}

}