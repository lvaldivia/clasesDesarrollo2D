package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		private var timer:Timer;
		//private var cuadrados:Array;
		private var cuadrados:Vector.<Sprite>;
		private var contar:int;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			cuadrados = new Vector.<Sprite>();
			contar = 0;
			//for (var i:int = 0; i < 10; i++) 
			//{
				//var cuadrado:Sprite = new Sprite();
				//cuadrado.graphics.beginFill(0x408080);
				//cuadrado.graphics.drawRect(0, 0, 50, 20);
				//cuadrado.graphics.endFill();
				//addChild(cuadrado);
				//cuadrados.push(cuadrado);
				//cuadrado.y = 100;
				//cuadrado.x = i * (cuadrado.width+10);
			//}
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER, mover);
			timer.start();
		}
		
		private function mover(e:TimerEvent):void 
		{
			var cuadrado:Sprite = new Sprite();
			cuadrado.tabIndex = timer.currentCount;
			cuadrado.graphics.beginFill(Math.random()*0xFFFFFF);
			cuadrado.graphics.drawRect(0, 0, 50, 20);
			cuadrado.graphics.endFill();
			addChild(cuadrado);
			cuadrados.push(cuadrado);
			cuadrado.y = Math.random()*stage.stageHeight;
			cuadrado.x = Math.random() * stage.stageWidth;
			cuadrado.addEventListener(MouseEvent.CLICK, desaparece);
			//for (var i:int = 0; i < cuadrados.length; i++) 
			//{
				//cuadrados[i].x += 10;
				//if (cuadrados[i].x >= stage.stageWidth + cuadrados[x].width) {
					//cuadrados[i].x =-cuadrados[i].width;
				//}
				//
			//}
		}
		
		private function desaparece(e:MouseEvent):void 
		{
			var tmp:Sprite = Sprite(e.currentTarget);
			var index:int = tmp.tabIndex;
			if (index % 2 == 0) {
				removeChild(tmp);	
				contar++;
				trace("muertos " + contar);
			}
			
			
		}
		
	}
	
}