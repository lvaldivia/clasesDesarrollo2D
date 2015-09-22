package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import utils.input.Dkeyboard;
	import utils.loader.DLoader;
	import utils.states.DstateManager;
	import views.Game;
	import views.GameOver;
	import views.Menu;
	
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Main extends Sprite 
	{
		private var hero:MovieClip;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);				
			DLoader.load("assetss.swf",startGame);
			
		}
		
		private function startGame():void 
		{
			DstateManager.init(this);
			DstateManager.register('menu', Menu);
			DstateManager.register('game', Game);
			DstateManager.register('gameover',GameOver);
			DstateManager.start('menu');
			

		}
		
		
		
				
		
	}
	
}