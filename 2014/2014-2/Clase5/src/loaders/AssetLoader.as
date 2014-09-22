package loaders 
{
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class AssetLoader 
	{
		private var loader:Loader;
		private var _callback:Function;
		public function AssetLoader(path:String,callback:Function=null) 
		{
			loader = new Loader();
			_callback = callback;
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
			loader.load(new URLRequest(path));
		}
		
		private function onProgress(e:ProgressEvent):void 
		{
			trace("% "+e.bytesLoaded / e.bytesTotal);
		}
		
		private function onError(e:IOErrorEvent):void 
		{
			trace("error");
		}
		
		private function onComplete(e:Event):void 
		{
			Global.assets = e.target.applicationDomain;
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, onProgress);
			if (_callback != null) {
				_callback();
			}
		}
		
	}

}