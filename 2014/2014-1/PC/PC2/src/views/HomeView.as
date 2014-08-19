package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	import com.greensock.events.TweenEvent;
	import flash.events.MouseEvent;
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import src.events.NavigationEvent;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class HomeView extends Sprite 
	{
		private var _bg:MovieClip;
		private var _timeline:TimelineMax; 
		
		public function HomeView() 
		{
			super();
			TweenPlugin.activate([GlowFilterPlugin]);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_bg = new home_view();
			addChild(_bg);
			
			_bg.alpha = 0;
			_bg.btnPlay.x = -200;
			_bg.btnRank.y = -50;
			
			_timeline = new TimelineMax();
			_timeline.append(TweenLite.to(_bg, 1, {alpha:1}));
			_timeline.append(TweenLite.to(_bg.btnPlay, 1, {x:150}));
			_timeline.append(TweenLite.to(_bg.btnRank, 1, { y:300 } ));
			
			_timeline.addEventListener(TweenEvent.COMPLETE, tlComplete);
			_timeline.addEventListener(TweenEvent.REVERSE_COMPLETE, tlReverse);
		}
		
		private function tlComplete(e:TweenEvent):void 
		{
			_bg.btnPlay.buttonMode = true;
			_bg.btnRank.buttonMode = true;
			
			_bg.btnPlay.addEventListener(MouseEvent.MOUSE_OVER, playOver);
			_bg.btnPlay.addEventListener(MouseEvent.MOUSE_OUT, playOut);
			_bg.btnPlay.addEventListener(MouseEvent.CLICK, playClick);
			_bg.btnRank.addEventListener(MouseEvent.MOUSE_OVER, rankOver);
			_bg.btnRank.addEventListener(MouseEvent.MOUSE_OUT, rankOut);
		}
		
		private function playOver(e:MouseEvent):void 
		{
			TweenLite.to(_bg.btnPlay, 0.5, { glowFilter: { color:0xFFFFCC, alpha:1, blurX:30, blurY:30 }} );
		}
		private function playOut(e:MouseEvent):void 
		{
			TweenLite.to(_bg.btnPlay, 0.5, { glowFilter: { color:0xFFFFCC, alpha:0, blurX:30, blurY:30 }} );
		}
		private function playClick(e:MouseEvent):void 
		{
			_timeline.reverse();
		}
		
		private function rankOver(e:MouseEvent):void 
		{
			TweenLite.to(_bg.btnRank, 0.5, { glowFilter: { color:0xFFFFCC, alpha:1, blurX:30, blurY:30 }} );
		}
		private function rankOut(e:MouseEvent):void 
		{
			TweenLite.to(_bg.btnRank, 0.5, { glowFilter: { color:0xFFFFCC, alpha:0, blurX:30, blurY:30 }} );
		}
		
		private function tlReverse(e:TweenEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, {view:"game_view"}, true));
		}
		
	}

}