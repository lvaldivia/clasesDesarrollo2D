package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.events.NavigationEvent;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class WinView extends Sprite 
	{
		private var _bg:MovieClip;
		
		public function WinView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_bg = new win_view();
			addChild(_bg);
			
			_bg.btnHome.buttonMode = true;
			_bg.btnHome.addEventListener(MouseEvent.CLICK, homeClick);
		}
		
		private function homeClick(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, {view:"home_view"}, true));
		}
		
	}

}