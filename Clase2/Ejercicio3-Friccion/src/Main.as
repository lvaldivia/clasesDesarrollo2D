package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		private var direccion:int;
		private var miHero:MovieClip;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var aceleracion:Number;
		private var velocidad_maxima:int;
		private var current_velocidad:Number;
		private var velocidad_x:Number;
		private var friction:Number;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			
			aceleracion = 0.3;
			velocidad_maxima = 20;
			velocidad_x = 0;
			current_velocidad = 0;
			friction = 0.93;
			removeEventListener(Event.ADDED_TO_STAGE, init);
			miHero = new hero();
			leftPress = false;
			rightPress = false;
			addChild(miHero);
			direccion = 1;
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, presionarTecla);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, soltarTecla);
			this.stage.addEventListener(Event.ENTER_FRAME, mover);
			//miHero.addEventListener(MouseEvent.CLICK, clickHero);
		}
		
		private function mover(e:Event):void 
		{
			if (rightPress) {
				direccion = 1;
				velocidad_x += aceleracion;
			}
			if (leftPress) {
				direccion = -1;
				velocidad_x += aceleracion;
			}
			if (velocidad_x >=velocidad_maxima) {
				velocidad_x = velocidad_maxima;
			}
			if (!rightPress && !leftPress) {
				velocidad_x *= friction;
			}
			if (velocidad_x <0) {
				velocidad_x = 0;
			}
			miHero.x += (velocidad_x*direccion);
		}
		
		private function soltarTecla(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT) {
				rightPress = false;
			}
			if (e.keyCode == Keyboard.LEFT) {
				leftPress = false;
			}
		}
		
		private function presionarTecla(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.RIGHT) {
				miHero.scaleX = 1;
				rightPress = true;
			}
			if (e.keyCode == Keyboard.LEFT) {
				miHero.scaleX = -1;
				leftPress = true;
			}
		}
		
		private function clickHero(e:MouseEvent):void 
		{
			if (e.currentTarget.x <=0) {
				direccion = 1;
				
			}if(e.currentTarget.x>=(stage.stageWidth-e.currentTarget.width)) {
				direccion = -1;
			}
			e.currentTarget.x += 20*direccion
		}
		
	}
	
}