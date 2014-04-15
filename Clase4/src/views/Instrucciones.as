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
	public class Instrucciones extends Sprite
	{
		private var content:MovieClip;
		public function Instrucciones() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, removedStage);
		}
		
		private function removedStage(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removedStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			content = new intro();
			addChild(content);
			content.btnJugar.addEventListener(MouseEvent.CLICK, downJugar);
		}
		
		private function downJugar(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, { view:'game' }, true));
		}
		
	}

}