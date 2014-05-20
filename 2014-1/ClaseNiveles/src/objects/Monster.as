package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.events.GameEvents;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class Monster extends Sprite
	{
		private var dead:Boolean;
		public function Monster() 
		{
			super();
			dead = false;
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(MouseEvent.CLICK, die);
			buttonMode = true;
		}
		
		private function die(e:MouseEvent):void 
		{
			if (dead==false) {
				dead = true;
				dispatchEvent(new GameEvents(GameEvents.MONSTER_KILLED, true));
			}
		}
		
	}

}