package utils.loader 
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	/**
	 * ...
	 * @author l
	 */
	public class DFileLoader 
	{
		static private var loader:URLLoader;
		static private var debug:Boolean;
		static private var onFnComplete:Function;

		public static function load(file:String,fnComplete:Function):void{
			loader = new URLLoader();
			onFnComplete = fnComplete;
			var request:URLRequest = new URLRequest();
			request.url = file;
			loader.addEventListener(Event.COMPLETE, onComplete,false,0,true);
			loader.addEventListener(IOErrorEvent.IO_ERROR,onError,false,0,true);
			loader.load(request);
		}

		static private function onError(e:IOErrorEvent):void{
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
			trace("[DFileLoader] There was a en error while loading the file");
		}

		static private function onComplete(e:Event):void 
		{
			var loader:URLLoader = URLLoader(e.target);
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR,onError);
			if(debug){
				trace("[DFileLoader] The file was loaded correctly "+String(loader.data));
			}
			if(onFnComplete!=null){
				onFnComplete(String(loader.data));
			}
		}
		
	}

}