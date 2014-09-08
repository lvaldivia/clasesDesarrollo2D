package 
{
	import events.GameEvent;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import views.manageView;
	
	/**
	 * ...
	 * @author ISIL
	 */
	[SWF(width=500,height=600)]
	public class Main extends Sprite 
	{
		
		private var loader:Loader;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeLoad);
			loader.load(new URLRequest("assets.swf"));
		}
		
		private function completeLoad(e:Event):void 
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, completeLoad);
			Global.assets = e.target.applicationDomain;
			var manage:manageView = new manageView();
			addChild(manage);
		}
		
	}
	
}