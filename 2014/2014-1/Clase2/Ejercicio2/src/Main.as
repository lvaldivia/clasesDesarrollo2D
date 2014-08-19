package src
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends Sprite 
	{
		private var rightPress:Boolean;
		private var leftPress:Boolean;
		private var miNave:MovieClip;
		private var upPress:Boolean;
		private var speed:Number = 5;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			rightPress = false;
			leftPress = false;
			miNave = new nave();
			this.addChild(miNave);
			miNave.x = stage.stageWidth / 2;
			miNave.y = stage.stageHeight / 2;
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, presionarTecla);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, soltarTecla);
			this.stage.addEventListener(Event.ENTER_FRAME, rotar);
		}
		
		private function rotar(e:Event):void 
		{
			if (leftPress) {
				miNave.rotation -= 5;
			}
			if (rightPress) {
				miNave.rotation += 5;
			}
			if (upPress) {
				var vx:Number = Math.sin(Math.PI*miNave.rotation/180)*speed;
				var vy:Number = Math.cos(Math.PI * miNave.rotation / 180) * speed;
				miNave.x += vx;
				miNave.y += vy;
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
			if (e.keyCode == Keyboard.UP) {
				upPress = false;
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
			if (e.keyCode == Keyboard.UP) {
				upPress = true;
			}
		}
		
		
	}
	
}