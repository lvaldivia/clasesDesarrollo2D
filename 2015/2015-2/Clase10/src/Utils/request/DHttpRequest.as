package Utils.request 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DHttpRequest 
	{
		static private var urlRequest:URLRequest;
		static private var loader:URLLoader;
		static public var onComplete:Function;
		
		static public function connect(_url:String,
										_variables:URLVariables=null,
										_onComplete:Function = null,
										_method:String="POST"):void{
			urlRequest = new URLRequest(_url);
			loader = new URLLoader();
			onComplete = _onComplete;
			loader.addEventListener(Event.COMPLETE, complete,
									false, 0, true);
			loader.addEventListener(IOErrorEvent.IO_ERROR, ioError, 
									false, 0, true);
			urlRequest.method = _method;
			if(_variables!=null){
				urlRequest.data = _variables;
			}			
		}
		
		static private function ioError(e:IOErrorEvent):void 
		{
			loader.removeEventListener(Event.COMPLETE, complete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
		}
		
		static private function complete(e:Event):void 
		{
			loader.removeEventListener(Event.COMPLETE, complete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			var result:String = trim(loader.data);
			if(onComplete!=null){
				onComplete(JSON.parse(result));
			}
		}
		
		public static function trim(s:String):String
		{
		   return s.replace( /^([\s|\t|\n]+)?(.*)([\s|\t|\n]+)?$/gm, "$2" );
		}
		
	}

}