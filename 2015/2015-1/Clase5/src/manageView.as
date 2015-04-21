package 
{
	import events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DView;
	import views.Game;
	import views.Menu;
	
	/**
	 * ...
	 * @author 
	 */
	public class manageView extends Sprite 
	{
		private var current:DView;		
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			current = new Menu();
			addChild(current);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			removeChild(current);
			switch (e._view) 
			{
				case 'game':
					current = new Game();
					addChild(current);
				break;
				default:
			}
			
		}
		
	}

}