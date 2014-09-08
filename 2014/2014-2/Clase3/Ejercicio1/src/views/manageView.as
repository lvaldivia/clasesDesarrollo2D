package views 
{
	import events.GameEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite
	{
		private var current:Sprite;
		private var old:Sprite;
		
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(GameEvent.CHANGE_VIEW, changeView);
			current = new Game();
			addChild(current);
		}
		
		private function changeView(e:GameEvent):void 
		{
			old = current;
			current = new Game2();
			addChild(current);
			removeChild(old);
		}
		
	}

}