package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import Utils.start.DStarling;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var assets:Vector.<String> = new Vector.<String>();
			assets.push("assets/assets.xml");
			assets.push("assets/assets.png");
			
			DStarling.init(ManageView, stage, assets);
		}
		
	}
	
}