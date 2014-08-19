package src
{
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		private var indice:int;
		private var miHero:MovieClip;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var circulo:Shape = new Shape();
			circulo.graphics.beginFill(0x000040);
			circulo.graphics.drawCircle(0, 0, 50);
			circulo.graphics.endFill();
			//addChild(circulo);
			circulo.x = 100;
			circulo.y = 100;
			
			var circulo2:Sprite = new Sprite();
			circulo2.graphics.beginFill(0x000040);
			circulo2.graphics.drawCircle(0, 0, 50);
			circulo2.graphics.endFill();
			//addChild(circulo2);
			circulo2.x = 200;
			circulo2.y = 300;
			circulo2.buttonMode = true;
			//circulo2.addEventListener(MouseEvent.CLICK, clickSprite);
			
			var cuadrado:Sprite = new Sprite();
			cuadrado.graphics.beginFill(0x408080);
			cuadrado.graphics.drawRect(0, 0, 50, 20);
			cuadrado.graphics.endFill();
			//addChild(cuadrado);
			cuadrado.x = 50;
			cuadrado.y = 150;
			
			var triangulo:Sprite = new Sprite();
			triangulo.graphics.beginFill(0x408080);
			triangulo.graphics.moveTo(0, 0);
			triangulo.graphics.lineTo(50, 0);
			triangulo.graphics.lineTo(50, 50);
			triangulo.graphics.lineTo(0, 0);
			triangulo.graphics.endFill();
			//addChild(triangulo);
			//trace(triangulo);
			
			var hexa:Sprite = new Sprite();
			hexa.graphics.beginFill(0x408080);
			hexa.graphics.moveTo(25, 0);
			hexa.graphics.lineTo(75, 0);
			hexa.graphics.lineTo(100, 50);
			hexa.graphics.lineTo(75, 100);
			hexa.graphics.lineTo(25, 100);
			hexa.graphics.lineTo(0, 50);
			hexa.graphics.lineTo(25, 0);
			hexa.graphics.endFill();
			//addChild(hexa);
			
			miHero = new hero();
			addChild(miHero);
			trace("total frames " + miHero.totalFrames);
			miHero.gotoAndStop(1);
			miHero.addEventListener(MouseEvent.CLICK, clickMovieclip);
			trace("estoy en " + miHero.currentFrame);
			indice = 1;
		}
		
		private function clickMovieclip(e:MouseEvent):void 
		{
			/*indice++;
			if (indice == 6) {
				indice = 1;
			}
			miHero.gotoAndStop(indice);*/ 
			if (miHero.totalFrames > miHero.currentFrame) {
				miHero.nextFrame();
			}else {
				miHero.gotoAndStop(1);
			}
			
		}
		
		

		
	}
	
}