package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	import utils.DKeyboard;
	import utils.DLoader;
	import utils.DMath;
	
	/**
	 * ...
	 * @author 
	 */
	public class Ship extends Sprite 
	{
		private var skin:Sprite;
		private var vx:Number;
		private var vy:Number;
		private var friction:Number = 0.95;
		private var speed:Number = 5;
		private var canShoot:Boolean;
		private var bullets:Vector.<Bullet>;
		
		public function Ship() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			canShoot = true;
			bullets = new Vector.<Bullet>();
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAsset("ship") as Class;
			skin = new c();
			skin.scaleX = skin.scaleY = 3;
			vx = 0;
			vy = 0;
			addChild(skin);
			x = stage.stageWidth / 2;
			y = stage.stageHeight / 2;
			rotation = 0;
		}
		
		public function update():void 
		{
			if (DKeyboard.leftPress) {
				rotation -= 5;
			}
			if (DKeyboard.rightPress) {
				rotation += 5;
			}
			if (DKeyboard.spacePress) {
				if (canShoot) {
					canShoot = false;
					var bullet:Bullet = new Bullet(x, y, rotation);
					stage.addChild(bullet);
					bullets.push(bullet);
					setTimeout(ableShoot, 500);
				}
			}
			if (bullets.length > 0) {
				for (var i:int = 0; i < bullets.length; i++) 
				{
					bullets[i].update();
				}
			}
			if (DKeyboard.upPress) {
				vy = Math.sin(DMath.radiansToDegrees(rotation))*speed;
				vx = Math.cos(DMath.radiansToDegrees(rotation))*speed;
			}else {
				vy *= friction;
				vx *= friction;
			}
			if (x < -width / 2) {
				
				x = stage.stageWidth + width / 2;
			}
			if (x>stage.stageWidth + width / 2) {
				x = -width / 2;
			}
			if (y < -height / 2) {
				y = stage.stageHeight + height / 2;
			}
			if (y > stage.stageWidth + width / 2) {
				y = -height / 2;
			}
			x += vx;
			y += vy;
		}
		
		private function ableShoot():void 
		{
			canShoot = true;
		}
		
		
	}

}