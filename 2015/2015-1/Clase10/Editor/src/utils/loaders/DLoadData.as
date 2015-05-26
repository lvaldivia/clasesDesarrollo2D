package utils.loaders 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	/**
	 * ...
	 * @author Luis
	 */
	public class DLoadData 
	{
		
		static private var request:URLRequest;
		static  private var loader:URLLoader;
		static public var onComplete:Function;
		static public function load(url:String,  variables:URLVariables= null):void {
			request = new URLRequest(url);
			loader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, onCompleteLoad);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
			loader.load(request);
		}
		
		static private function onCompleteLoad(e:Event):void 
		{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
			var result_data:String = trim(String(loader.data)); 
			trace(result_data);
			var obj:Object = JSON.parse(result_data);
			onComplete(obj);
		}
		
		public static function trim(p_string:String):String {  
            if (p_string == null) { return ''; }  
            return p_string.replace(/^\s+|\s+$/g, '');  
        } 
		
		static private function onErrorHandler(e:IOErrorEvent):void 
		{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onErrorHandler);
		}
		
	}

}