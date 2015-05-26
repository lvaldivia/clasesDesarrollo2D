package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.loaders.DLoader;
	
	/**
	 * ...
	 * @author 
	 */
	[SWF(height=700, width=1000)]
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
			DLoader.load("tiles.swf", goGame);
		}
		
		private function goGame():void 
		{
			var editor:Editor = new Editor();
			addChild(editor);
		}
		
	}
	
}