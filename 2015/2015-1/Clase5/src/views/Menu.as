package views 
{
	import events.NavigationEvent;
	import flash.events.MouseEvent;
	import utils.DView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Menu extends DView 
	{
		
		public function Menu() 
		{
			super();
			currentClip = "view_main";
		}
		
		override public function init():void {
			super.init();
			skin.btnPlay.buttonMode = true;
			skin.btnPlay.addEventListener(MouseEvent.CLICK, goPlay);
		}
		
		private function goPlay(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW,'game'));
		}
		
		
		
	}

}