package src.views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.events.GameEvent;
	import src.events.NavigationEvent;
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite
	{
		private var home:Home;
		private var instro:Instrucciones;
		private var game:Game;
		public function manageView() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			//trace("agregamos scena");
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
			addEventListener(GameEvent.GAME_WIN, gameWin);
			home = new Home();
			addChild(home);
		}
		
		private function gameWin(e:GameEvent):void 
		{
			trace("acabo");
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			switch (e.params.view) 
			{
				case 'instrucciones':
					instro = new Instrucciones();
					addChild(instro);
					removeChild(home);
				break;
				case 'game':
					game = new Game();
					addChild(game);
					removeChild(instro);
				break;
				default:
			}
		}
		
	}

}