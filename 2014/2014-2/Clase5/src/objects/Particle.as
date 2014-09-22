package objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Particle extends Sprite
	{
		private var acceX:Number=0;
		private var acceY:Number = 0.3;
		private var velX:Number;
		private var velY:Number;
		public function Particle() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			graphics.beginFill(Math.random() * 0xFF00FF);
			graphics.drawRect(0, 0, 50, 50);
			var angle:Number = 2 * Math.PI;
			var speed:Number = Math.random() * 5;
			velX = Math.sin(angle)*speed;
			velY = Math.cos(angle)*speed;
		}
		
		public function update():void {
			velX += acceX;
			velY += acceY;
			x += velX;
			y += velY;
		}
		
		
	}

}