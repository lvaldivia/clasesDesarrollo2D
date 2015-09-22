package utils.loader 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class DLoader 
	{
		private static var loader:Loader;
		private static var _fnOnComplete:Function;
		
		public  static function load(url:String,fnComplete:Function):void
		{
		 loader = new Loader();
		 _fnOnComplete = fnComplete;
		 loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		 loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
		 loader.load(new URLRequest(url));
		}
		
		static public function getAsset(name:String):Class 
		{
			var c:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class;
			return c;
		}
		
		static private function onError(e:IOErrorEvent):void 
		{
			trace("Hubo Error");
		}
		
		static private function onComplete(e:Event):void 
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_fnOnComplete();
			
		}
		
	}

}