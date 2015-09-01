package
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.input.DKeyboard;
	import utils.loader.DLoader;
	import utils.states.DStateManager;
	import views.Game;
	import views.Menu;
	
	/**
	 * ...
	 * @author ISIL
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
			DStateManager.init(this);
			DStateManager.register('menu', Menu);
			DStateManager.register('game', Game);
			DStateManager.start('menu');
		}
		
	}
	
}