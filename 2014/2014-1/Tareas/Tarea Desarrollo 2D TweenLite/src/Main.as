package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import src.ManageView;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Bounce;
	/**
	 * ...
	 * @author Alonso
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var manage:ManageView = new ManageView();
			addChild(manage);
		}
		
	}
	
}