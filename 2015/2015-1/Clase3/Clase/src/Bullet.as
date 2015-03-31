package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DLoader;
	import utils.DMath;
	
	/**
	 * ...
	 * @author 
	 */
	public class Bullet extends Sprite 
	{
		private var skin:Sprite;
		private var posX:Number;
		private var posY:Number;
		private var shipRotation:Number;
		private var vx:Number;
		private var vy:Number;
		private var speed:Number=2;
		
		public function Bullet(_x:Number,_y:Number, _rotation:Number) 
		{
			super();
			posX = _x;
			posY = _y;
			vx = 0;
			vy = 0;
			shipRotation = _rotation;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAsset("bullet") as Class;
			skin = new c();
			rotation = shipRotation;
			addChild(skin);
			x = posX;
			y = posY;
			vx = Math.cos(DMath.radiansToDegrees(rotation)) * speed;
			vy = Math.sin(DMath.radiansToDegrees(rotation)) * speed;
		}
		
		public function update():void {
			x += vx;
			y += vy;
		}
		
	}

}