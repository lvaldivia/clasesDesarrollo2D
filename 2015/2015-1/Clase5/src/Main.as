package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DLoader;
	import views.Menu;
	
	/**
	 * ...
	 * @author 
	 */
	[SWF(width="640",height="480")]
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
			DLoader.load("assets_clase5.swf", goGame);
		}
		
		private function goGame():void 
		{
			var manage:manageView = new manageView();
			addChild(manage);
		}
		
	}
	
}