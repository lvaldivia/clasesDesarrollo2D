package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import loaders.AssetLoader;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	[SWF(width=970,height=582)]
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var loader:AssetLoader = new AssetLoader('assets.swf',createManage);
		}
		
		private function imprimir():void {
			trace("soy un callback");
		}
		
		private function createManage():void {
			var manage:manageView = new manageView();
			addChild(manage);
		}
		
	}
	
}