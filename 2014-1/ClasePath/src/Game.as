package  src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import lib.PathFinder;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		private var miMapa:Array;
		private var miAncho:int = 20;
		private var miAlto:int = 10;
		private var puntoHero:Point;
		private var puntoFinal:Point;
		private var mejorRuta:Array;
		private var heroSprite:Sprite;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var pathMap:Array=[
				0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,
				0,0,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,1,0,
				0,0,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,
				0,0,0,0,0,0,1,0,1,1,1,1,0,1,0,1,1,1,1,0,
				1,1,1,0,0,0,1,0,0,0,0,1,0,1,0,1,0,0,0,0,
				0,0,0,0,0,0,1,1,1,0,0,1,0,0,0,1,0,0,1,1,
				0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,0,1,0,
				0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0,0,
				0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,0,1,0,0,0,
				0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			miMapa = convertirArray(miAncho, miAlto, pathMap);
			puntoHero = new Point(0, 9);
			puntoFinal = new Point(19, 0);
			mejorRuta = PathFinder.getBestPath(puntoHero.x, puntoHero.y, puntoFinal.x, puntoFinal.y, miMapa);			
			dibujarMapa();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, presionarTecla);
		}
		
		private function presionarTecla(e:KeyboardEvent):void 
		{
			var nuevaPos:Point=puntoHero.clone();
			switch (e.keyCode) 
			{
				case Keyboard.RIGHT:
					nuevaPos.x++;
				break;
				case Keyboard.LEFT:
					nuevaPos.x--;
				break;
				case Keyboard.UP:
					nuevaPos.y--;
				break;
				case Keyboard.DOWN:
					nuevaPos.y++;
				break;
			}
			if (nuevaPos.x<0) {
				nuevaPos.x = 0;
			}
			if (nuevaPos.x >= miAncho - 1) {
				nuevaPos.x = miAncho - 1;
			}
			if (nuevaPos.y<0) {
				nuevaPos.y = 0;
			}
			if (nuevaPos.y >= miAlto - 1) {
				nuevaPos.y = miAlto - 1;
			}
			if (miMapa[nuevaPos.x][nuevaPos.y]==0) {
				puntoHero = nuevaPos.clone();
				mejorRuta = PathFinder.getBestPath(puntoHero.x, puntoHero.y, puntoFinal.x, puntoFinal.y, miMapa);			
				dibujarMapa();
			}
		}
		
		private function dibujarMapa():void 
		{
			graphics.clear();
			graphics.lineStyle(1, 0xFFFFFF);
			for (var i:int = 0; i < miAncho; i++) 
			{
				for (var j:int = 0; j < miAlto; j++) 
				{
					if (miMapa[i][j] > 0){
						graphics.beginFill(0x999999);
					}else {
						graphics.beginFill(0x0000FF);
					}
					graphics.drawRect(i * 24, j * 24, 24, 24);
					graphics.endFill();
				}
			}
			//dibujando mejor ruta
			if (mejorRuta.length > 0) {
				for (var k:int = 0; k < mejorRuta.length; k++) 
				{
					graphics.beginFill(0x66FF00);
					graphics.drawRect(mejorRuta[k].x * 24, mejorRuta[k].y * 24, 24, 24);
					graphics.endFill();
				}
			}
			//dibujando extremos
			graphics.beginFill(0x000000);
			graphics.drawRect(puntoHero.x * 24, puntoHero.y * 24, 24, 24);
			graphics.endFill();
			graphics.beginFill(0xFF0000);
			graphics.drawRect(puntoFinal.x * 24, puntoFinal.y * 24, 24, 24);
			graphics.endFill();
		}
		
		
		private function convertirArray(ancho:int, alto:int,matrix:Array):Array {
			var mapa:Array = new Array(ancho);
			for (var i:int = 0; i < ancho; i++) 
			{
				mapa[i] = new Array(alto);
				for (var j:int = 0; j < alto; j++) 
				{
					mapa[i][j] = matrix[i + j * ancho];
				}
			}
			return mapa;
		}
		
		
	}

}