package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import src.events.NavigationEvent;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class PreloadingView extends Sprite 
	{
		private var _bg:MovieClip;
		private var _timer:Timer;
		
		public function PreloadingView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_bg = new preloading_view;
			addChild(_bg);
			
			_timer = new Timer(2000, 1);
			_timer.start();
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, timeUp);
		}
		
		private function timeUp(e:TimerEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, {view:"home_view"}, true));
			//trace("time up!");
		}
		
	}

}