package src.views 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.utils.getTimer;
	import src.objects.Enemy;
	import src.objects.Fondo;
	import src.objects.Heroe;
	import src.objects.Montanas;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class Game extends Sprite
	{
		private var fondo:Fondo;
		private var montanas:Vector.<Montanas>;
		private var currentTime:int;
		private var tiempoP:Number = 0;
		private var maxCurrentTimer:Number = 0.07;
		private var enemy:Enemy;
		private var heroe:Heroe;
		private var bmd_heroe:BitmapData;
		private var bmd_enemy:BitmapData;
		private var p1:Point;
		private var p2:Point;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			fondo = new Fondo();
			addChild(fondo);
			crearMontanas();
			crearObjetos();
			currentTime = getTimer();
			addEventListener(Event.ENTER_FRAME, move);
		}
		
		private function crearObjetos():void 
		{
			heroe = new Heroe();
			heroe.y = stage.stageHeight - 150;
			addChild(heroe);
			enemy = new Enemy();
			addChild(enemy);
			p1 = new Point(heroe.x, heroe.y);
			p2 = new Point(enemy.x, enemy.y);
			bmd_heroe = new BitmapData(150, 150, true, 0x000000);
			bmd_enemy = new BitmapData(100, 50, true, 0x000000);
			bmd_heroe.draw(heroe);
			bmd_enemy.draw(enemy);
		}
		
		private function crearMontanas():void 
		{
			montanas = new Vector.<Montanas>();
			for (var i:int = 0; i<3 ; i++) 
			{
				var monta:Montanas = new Montanas(i);
				montanas.push(monta);
				addChild(monta);
			}
		}
		
		private function move(e:Event):void 
		{
			var dt:Number = (getTimer()-currentTime) * 0.001;
			currentTime = getTimer();
			tiempoP += dt;
			if (tiempoP >= maxCurrentTimer)
			{
				for (var i:int = 0; i < montanas.length; i++) 
				{
					montanas[i].mover();
				}
				tiempoP = 0;
			}
			enemy.mover();
			//if (heroe.hitTestObject(enemy)) {
				//trace("chocar");
			//}
			//if (heroe.x+heroe.width >=enemy.x) {
				//trace("chocamos");
			//}
			//colision por bitmap
			p1.x = heroe.x;
			p1.y = heroe.y;
			//trace(heroe.x, heroe.y);
			p2.x = enemy.x;
			p2.y = enemy.y;
			//trace((bmd_heroe.hitTest(p1, 255, bmd_enemy, p2, 255)));
			if (bmd_heroe.hitTest(p1,255,bmd_enemy,p2,255)) {
				trace("chocamos por bitmap");
			}
			
		}
		
	}

}