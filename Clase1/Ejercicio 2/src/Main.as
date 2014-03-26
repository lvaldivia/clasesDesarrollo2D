package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author Richard Da Cruz
	 */
	public class Main extends Sprite 
	{
		private var nave:MiNave = new MiNave();
		private var bala:MiBala;
		private var balas:Array;
		private var enemigos:Array;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			crearNave();
			crearEnemigos();
		}
		
		private function crearEnemigos():void 
		{
			enemigos = new Array();
			for (var i:int = 0; i < 5; i++) 
			{
				var pX:int = i * 120;
				var tempEnemigo:MiEnemigo = new MiEnemigo(pX);
				this.addChild(tempEnemigo)
				enemigos.push(tempEnemigo);
			}
			
		}
		
		private function crearNave():void 
		{
			nave = new MiNave();
			this.addChild(nave);
			nave.y = 500;
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moverMouse);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, presionarTecla);
			stage.addEventListener(Event.ENTER_FRAME, moverObjeto)
			balas = new Array();
	
		}
		
		private function moverObjeto(e:Event):void 
		{
			for (var i:int = 0; i < balas.length; i++) 
			{
				balas[i].mover();
			}
			for (var j:int = 0; j < enemigos.length; j++) 
			{
				for (var k:int = 0; k < balas.length; k++) 
				{
					if (enemigos[j].hitTestObject(balas[k]))
					{
						enemigos[j].morir();
					}
				}
			}
		}
		
		private function presionarTecla(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.SPACE)
			{
				var tmpBala:MiBala = new MiBala(nave.x, nave.y);
				balas.push(tmpBala);
				this.addChild(tmpBala);
			}
		}
		
		private function moverMouse(e:MouseEvent):void 
		{
			nave.x = mouseX;
		}
		
	}
	
}