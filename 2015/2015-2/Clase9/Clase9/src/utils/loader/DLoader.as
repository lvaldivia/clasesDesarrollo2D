package utils.loader 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DLoader 
	{
		
		private static var loader:Loader;
		private static var _fnOnComplete:Function;
		
		public static function load(url:String,fnComplete:Function):void {
			loader = new Loader();
			_fnOnComplete = fnComplete;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			var _lc:LoaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null)
			loader.load(new URLRequest(url),_lc);
		}
		
		static public function getAsset(name:String):Class
		{
			try{
				var c:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) 
						as Class;
				return c;
			}
			catch(e:Error){
				trace("The class " + name +" was not found in the current context");
				
			}
			return null;
		}
		
		static private function onError(e:IOErrorEvent):void 
		{
			trace("There was an error in the url of the file");
		}
		
		static private function onComplete(e:Event):void 
		{
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_fnOnComplete();
		}
		
	}

}