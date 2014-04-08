package src.views 
{
	import com.greensock.easing.Bounce;
	import com.greensock.TweenLite;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.plugins.GlowFilterPlugin;
	import com.greensock.plugins.DropShadowFilterPlugin;
	import com.greensock.plugins.TweenPlugin;
		
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class HomeView extends Sprite 
	{
		private var bg:MovieClip;
		
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
			TweenLite.to(bg, 1, { y:0, ease:Bounce.easeOut,onComplete:animarBotones } );
		}
		
		private function animarBotones():void 
		{
			TweenLite.to(bg.jugar, 0.5, { scaleX:1, scaleY:1, onComplete:animarInstrucciones } );
			
		}
		
		private function animarInstrucciones():void 
		{
			TweenLite.to(bg.instrucciones, 0.5, { scaleX:1, scaleY:1 } );
			bg.jugar.addEventListener(MouseEvent.CLICK, clickJugar);
			bg.jugar.addEventListener(MouseEvent.MOUSE_OVER, overJugar);
			bg.jugar.addEventListener(MouseEvent.MOUSE_OUT, outJugar);
			bg.jugar.buttonMode = true;
			bg.instrucciones.addEventListener(MouseEvent.CLICK, clickInstrucciones);
			bg.instrucciones.buttonMode = true;
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
			TweenLite.to(bg.jugar, 0.5, { alpha:0 } );
		}
		
	}

}