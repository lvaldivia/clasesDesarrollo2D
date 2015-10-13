package utils.video 
{
	import flash.events.NetStatusEvent;
	import flash.net.NetStream;
	/**
	 * ...
	 * @author l
	 */
	public class VideoStream 
	{
		public static var ns:NetStream;
		public static var onStart:Function;
		public static var onStop:Function;
		public static var videoDuration:Number;
		public static function init():void
		{
			ns = new NetStream(Connector.nc);
			ns.client = { onMetaData: onMetaData };
			videoDuration = 0;
			ns.addEventListener(NetStatusEvent.NET_STATUS, nsStatusHandler, false, 0, true);
		}
		
		static private function onMetaData(infoObject:Object):void 
		{
			videoDuration = infoObject.duration;
		}
		
		static public function play(stream:String):void{
			ns.play(stream);
		}
		
		static public function resume():void{
			ns.resume();
		}
		
		static public function pause():void{
			ns.pause();
		}
		
		static private function nsStatusHandler(evt:NetStatusEvent):void 
		{
			trace(evt.info.code);
			switch (evt.info.code)
			{
				case "NetStream.Play.Start": 
					try 
					{
						onStart();
					}
					catch(e:Error){
						trace("[Stream] onStart function is not defined");
					}
					break;
				case "NetStream.Play.Stop": 
					ns.pause();
					ns.seek(0);
					try 
					{
						onStop();
					}
					catch(e:Error){
						trace("[Stream] onStart function is not defined");
					}
					break;
			}
		}
		
	}

}