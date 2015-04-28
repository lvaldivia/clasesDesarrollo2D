package views 
{
	import com.greensock.events.TweenEvent;
	import com.greensock.TimelineLite;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	import events.NavigationEvent;
	import flash.events.MouseEvent;
	import utils.DView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Menu extends DView 
	{
		private var timeline:TimelineMax;
		public function Menu() 
		{
			super();
			currentClip = "view_main";
		}
		
		override public function init():void {
			super.init();
			skin.btnPlay.buttonMode = true;
			skin.btnPlay.alpha = 0;
			skin.title.alpha = 0;
			skin.bg.alpha = 0;
			skin.bg.y = -skin.bg.height;
			
			skin.btnPlay.addEventListener(MouseEvent.CLICK, goPlay);
			skin.btnPlay.addEventListener(MouseEvent.MOUSE_OVER, over);
			skin.btnPlay.addEventListener(MouseEvent.MOUSE_OUT, out);
		}
		
		override public function initAnim():void {
			timeline = new TimelineMax();
			timeline.append(TweenLite.to(skin.bg, 0.5, { alpha:1, y:240 } ));
			timeline.append(TweenLite.to(skin.title, 0.5, { alpha:1 } ));
			timeline.append(TweenLite.to(skin.btnPlay, 0.5, { alpha:1 } ));
		}
		
		
		private function out(e:MouseEvent):void 
		{
			TweenLite.to(skin.btnPlay, 0.2, { scaleX:1.44, scaleY:1.44 } );
		}
		
		private function over(e:MouseEvent):void 
		{
			TweenLite.to(skin.btnPlay, 0.2, { scaleX:1.9, scaleY:1.9 } );
		}
		
		private function goPlay(e:MouseEvent):void 
		{
			timeline.reverse();
			timeline.addEventListener(TweenEvent.REVERSE_COMPLETE, reverse);
		}
		
		private function reverse(e:TweenEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW,'game'));
		}
	}

}