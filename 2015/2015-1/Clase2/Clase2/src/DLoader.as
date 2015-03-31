package
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author
	 */
	public class DLoader
	{
		static private var loader:Loader;
		static private var _callback:Function;
		
		static public function load(url:String,callback:Function=null):void
		{
			loader = new Loader();
			_callback = callback;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.load(new URLRequest(url));
		}
		
		static private function onError(e:IOErrorEvent):void 
		{
			trace("hubo un error en la url");
		}
		
		static private function onComplete(e:Event):void
		{
			_callback();
		}
		
		static public function getAsset(name:String):Class {
			var c:Class = loader.contentLoaderInfo.applicationDomain.getDefinition(name) as Class; 
			return c;
		}
	
	}

}