package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.GameInputEvent;
	
	/**
	 * ...
	 * @author 
	 */
	[SWF(height="450", width="800")]
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
			var game:Game = new Game();
			addChild(game);
		}
		
	}
	
}