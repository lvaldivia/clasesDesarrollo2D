package src.views 
{
	import com.greensock.easing.Bounce;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.TimelineMax;
	import com.greensock.plugins.DropShadowFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.events.TweenEvent;
	import src.events.NavigationEvent;
		
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class HomeView extends Sprite 
	{
		private var bg:MovieClip;
		private var timeline:TimelineMax;
		
		public function HomeView() 
		{
			super();
			TweenPlugin.activate([GlowFilterPlugin, DropShadowFilterPlugin]);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			bg = new home_view();
			this.addChild(bg);
			animar();
		}
		
		private function animar():void 
		{
			bg.y = -bg.height;
			bg.jugar.scaleX = bg.jugar.scaleY = 0;
			bg.instrucciones.scaleX = bg.instrucciones.scaleY = 0;
			timeline = new TimelineMax();
			timeline.append(TweenLite.to(bg, 1, { y:0, ease:Bounce.easeOut} ));
			timeline.append(TweenLite.to(bg.jugar, 0.5, { scaleX:1, scaleY:1 } ));
			//timeline.append(TweenLite.to(bg, 0.5, { y: -bg.height } ));
			timeline.append(TweenLite.to(bg.instrucciones, 0.5, { scaleX:1, scaleY:1 } ));
			timeline.addEventListener(TweenEvent.COMPLETE, animarInstrucciones);
			timeline.addEventListener(TweenEvent.REVERSE_COMPLETE, terminoReversa);
		}
		
		private function terminoReversa(e:TweenEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, true));
		}
		
		private function animarInstrucciones(e:TweenEvent):void 
		{
			bg.jugar.addEventListener(MouseEvent.CLICK, clickJugar);
			bg.jugar.addEventListener(MouseEvent.MOUSE_OVER, overJugar);
			bg.jugar.addEventListener(MouseEvent.MOUSE_OUT, outJugar);
			bg.instrucciones.addEventListener(MouseEvent.CLICK, clickInstrucciones);
			bg.jugar.buttonMode = true;
			bg.instrucciones.buttonMode = true;
		}
		
		private function parpadear():void 
		{
			TweenLite.to(bg.jugar, 1, { scaleX:0.5, scaleY:0.5,onComplete:parpadear2 } );
		}
		
		private function parpadear2():void {
			TweenLite.to(bg.jugar, 1, { scaleX:1, scaleY:1,onComplete:parpadear } );
		}
		
		private function outJugar(e:MouseEvent):void 
		{
			TweenLite.to(bg.jugar, 1, {glowFilter:{color:0x33ffff, alpha:0, blurX:30, blurY:30}});
		}
		
		private function overJugar(e:MouseEvent):void 
		{
			TweenLite.to(bg.jugar, 1, {glowFilter:{color:0x33ffff, alpha:1, blurX:30, blurY:30}});
		}
		
		private function clickInstrucciones(e:MouseEvent):void 
		{
			TweenLite.to(bg.instrucciones, 1, {onComplete:sacarMenu,dropShadowFilter:{color:0xff0000, alpha:1, blurX:12, blurY:12, distance:12}});
		}
		
		private function sacarMenu():void 
		{
			TweenLite.to(bg, 0.2, { y: -bg.height } );
		}
		
		private function clickJugar(e:MouseEvent):void 
		{
			bg.jugar.removeEventListener(MouseEvent.CLICK, clickJugar);
			bg.jugar.removeEventListener(MouseEvent.MOUSE_OVER, overJugar);
			bg.jugar.removeEventListener(MouseEvent.MOUSE_OUT, outJugar);
			timeline.reverse();
			
		}
		
	}

}