package utils.video 
{
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	/**
	 * ...
	 * @author l
	 */
	public class Connector 
	{
		public static var nc:NetConnection;
		private static var content:Sprite;
		public static var onConnected:Function;
		public static var onClosed:Function;
		private static var serverUrl:String;
		
		public static function init(_content:Sprite,_serverUrl:String = ""):void{
			nc = new NetConnection();
			content = _content;
			serverUrl = _serverUrl;
			nc.client = content;
			nc.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler,false,0,true);
			nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityHandler,false,0,true);
			nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, asynErrorHandler, false, 0, true);
			nc.addEventListener(IOErrorEvent.IO_ERROR, errorNetwork,false,0,true);
		}
		
		static private function errorNetwork(e:IOErrorEvent):void 
		{
			
		}
		
		static public function connect():void {
			try 
			{
				if(serverUrl!=""){
					nc.connect(serverUrl);
				}else{
					nc.connect(null);
				}
				
			}
			catch(e:Error){
				trace("[Connector] there was an unexpected error " + e.message);
			}
			
		}
		
		static public function close():void{
			nc.removeEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
			nc.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityHandler);
			nc.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, asynErrorHandler)
			nc.removeEventListener(IOErrorEvent.IO_ERROR, errorNetwork);
			nc.close();
		}
		
		static private function asynErrorHandler(e:AsyncErrorEvent):void 
		{
			
		}
		
		static private function securityHandler(e:SecurityErrorEvent):void 
		{
			
		}
		
		static private function netStatusHandler(e:NetStatusEvent):void 
		{
			if (e.info.code == 'NetConnection.Connect.Success')
			{
				try 
				{
					trace("[Connector] Connection succesfully");
					onConnected();
				}catch(e:Error){
					trace("[Connector] onConnected Function is not defined ");
				}
			}
			if (e.info.code == 'NetConnection.Connect.Failed') {
				nc.removeEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
				nc.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityHandler);
				nc.removeEventListener(AsyncErrorEvent.ASYNC_ERROR, asynErrorHandler)
				nc.removeEventListener(IOErrorEvent.IO_ERROR, errorNetwork);
				nc.close();
				try 
				{
					onClosed();
				}catch(e:Error){
					trace("[Connector] onClosed Function is not defined ");
				}
			}
		}
		
		
	}

}