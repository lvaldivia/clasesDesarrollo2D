package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.views.Game;
	import utils.views.DView;
	/**
	 * ...
	 * @author 
	 */
	public class manageView extends Sprite
	{
		private var current:DView;
		private var old:DView;
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			current = new Game();
			addChild(current);
		}
		
		
	}

}