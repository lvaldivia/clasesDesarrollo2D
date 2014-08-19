package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author jorge
	 */
	public class Main extends Sprite 
	{
		private var nave:box = new box();
		private var bala:bullet;
		private var balas:Array;
		private var enemigos:Array;
		private var rightPress:Boolean;
		private var leftPress:Boolean;
		private var spacePress:Boolean;
		private var lapso:int=0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			crearNave();
		}
		
		private function crearNave():void 
		{
			nave = new box();
			this.addChild(nave);
			nave.y = 450;
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, presionarTecla);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, soltarTecla);
			this.stage.addEventListener(Event.ENTER_FRAME, mover);
			balas = new Array();
			nave.x = stage.stageWidth / 2;
		}
		
		private function mover(e:Event):void 
		{
			if (leftPress) {
				nave.x -= 5;
			}
			if (rightPress) {
				nave.x += 5;
			}
			if (nave.x >= stage.stageWidth - nave.width/2)
			{
				nave.x = stage.stageWidth - nave.width/2;
			}
			if (nave.x <= nave.width/2)
			{
				nave.x = nave.width/2;
			}
			if (spacePress)
			{
				
			}
			
		}
		
		private function soltarTecla(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.LEFT) {
				leftPress = false;
			}
			if (e.keyCode == Keyboard.RIGHT) {
				rightPress = false;
			}
			if (e.keyCode == Keyboard.SPACE) {
				spacePress = false;
				lapso = 0;
			}
		}
		
		private function presionarTecla(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.LEFT) {
				leftPress = true;
			}
			if (e.keyCode == Keyboard.RIGHT) {
				rightPress = true;
			}
			if (e.keyCode == Keyboard.SPACE) {
				spacePress = true;
				if (lapso == 0) {
					var tmpBala:bullet = new bullet(nave.x, nave.y);
					balas.push(tmpBala);
					this.addChild(tmpBala);
				}
				lapso = 1;
			}
		}
		
	}
	
}