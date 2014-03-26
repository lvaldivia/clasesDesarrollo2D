package src
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author Richard Da Cruz
	 */
	public class Main extends Sprite 
	{
		private var contador:int; 
		private var miTimer:Timer;
		private var miCuadrado:MovieClip;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			contador = 0;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var contador:int; 
			miCuadrado = new cuadrado_2();
			miCuadrado.x = 50;
			addChild(miCuadrado)
			miCuadrado.stop();
			//miCuadrado.addEventListener(MouseEvent.MOUSE_OVER,overCuadrado)
			//miCuadrado.addEventListener(MouseEvent.MOUSE_OUT,outCuadrado)
			miCuadrado.addEventListener(MouseEvent.CLICK,sgt)
			//miTimer = new Timer(1000, 5);
			//miTimer.addEventListener(TimerEvent.TIMER, crearObjetos)
			//miTimer.start();
		}
		private function sgt(e:MouseEvent):void
		{
			miCuadrado.nextFrame();
			if(miCuadrado.currentFrame == 6)
			   {
				   miCuadrado.gotoAndStop(1);
			   }
		}
		
		private function outCuadrado(e:MouseEvent):void 
		{
			//miCuadrado.gotoAndStop(1);
			miCuadrado.nextFrame();
		}
		
		private function overCuadrado(e:MouseEvent):void 
		{
			//miCuadrado.gotoAndStop(2);
			miCuadrado.prevFrame();
		}
		
		private function crearObjetos(e:TimerEvent):void 
		{
			var cuadrado:Sprite = new Sprite();
			cuadrado.graphics.beginFill(0x0066CC);
			cuadrado.graphics.drawRect(0, 0, 50, 40);
			cuadrado.graphics.endFill();
			cuadrado.buttonMode = true;
			cuadrado.x=(miTimer.currentCount*(cuadrado.width+10));
			this.addChild(cuadrado);
			cuadrado.addEventListener(MouseEvent.CLICK, clickear)
		}
		
		private function clickear(e:MouseEvent):void 
		{
			contador++
			txt_prueba.text=contador.toString();
		}
		
	}
	
}