package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DLoader;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			DLoader.load("assetsShip.swf", startGame);
		}
		
		private function startGame():void 
		{
			var game:Game = new Game();
			addChild(game);
		}
		
	}
	
}