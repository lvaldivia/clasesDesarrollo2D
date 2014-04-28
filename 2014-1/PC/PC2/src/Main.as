package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.views.ViewManager;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class Main extends Sprite 
	{
		private var _manager:ViewManager;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_manager = new ViewManager();
			addChild(_manager);
		}
		
	}
	
}