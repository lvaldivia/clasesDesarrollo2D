package src.views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.events.NavigationEvent;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class ViewManager extends Sprite 
	{
		private var _preloading:PreloadingView;
		private var _home:HomeView;
		private var _game:GameView;
		private var _win:WinView;
		
		public function ViewManager() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_preloading = new PreloadingView();
			addChild(_preloading);
			//_game = new GameView();
			//addChild(_game);
			
			addEventListener(NavigationEvent.CHANGE_VIEW, viewChanged);
		}
		
		private function viewChanged(e:NavigationEvent):void 
		{
			switch(e.params.view) {
				case "home_view":
					if (_win) removeChild(_win);
					_home = new HomeView();
					addChild(_home);
					removeChild(_preloading);
					break;
				case "game_view":
					_game = new GameView();
					addChild(_game);
					removeChild(_home);
					break;
				case "win_view":
					_win = new WinView();
					addChild(_win);
					removeChild(_game);
					break;
			}
		}
		
	}

}