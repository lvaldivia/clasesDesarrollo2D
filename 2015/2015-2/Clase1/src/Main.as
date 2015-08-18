package
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.input.DKeyboard;
	import utils.loader.DLoader;
	
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
			DLoader.load("assets.swf",startGame);
		}
		
		private function startGame():void 
		{
			var hero:Hero = new Hero();
			addChild(hero);
		}
		
	}
	
}