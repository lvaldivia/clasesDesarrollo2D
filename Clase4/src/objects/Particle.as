package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.media.Microphone;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Particle extends Sprite
	{
		private var veloY:Number;
		private var veloX:Number;
		private var posX:Number;
		private var posY:Number;
		
		public function Particle() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		public function updatePos(pX:Number, pY:Number ):void {
			x = pX;
			y = pY;
			this.visible = true;
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			this.visible = false;
			graphics.beginFill(Math.random() * 0x00FF00);
			graphics.drawRect(0, 0, 10, 10);
			graphics.endFill();
			var angle:Number = 2*Math.PI*Math.random();
			var speed:Number = 4;
			veloX = Math.sin(angle)*speed;
			veloY = Math.cos(angle)*speed;
		}
		
		public function update():void {
			if(visible!=false){
				x += veloX;			
				y += veloY;
			}
		}
		
	}

}