package utils.loaders 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author 
	 */
	public class DLoadData 
	{
		static private var loader:URLLoader;
		static private var request:URLRequest;
		static public var onComplete:Function;
		static public function load(url:String):void {
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, completeLoader);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			request = new URLRequest(url);
			loader.load(request);
		}
		
		static private function onError(e:IOErrorEvent):void 
		{
			loader.removeEventListener(Event.COMPLETE, completeLoader);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			trace("hubo un error");
		}
		
		static private function completeLoader(e:Event):void 
		{
			loader.removeEventListener(Event.COMPLETE, completeLoader);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			var obj:Object = JSON.parse(loader.data);
			onComplete(obj);
			
		}
		
	}

}