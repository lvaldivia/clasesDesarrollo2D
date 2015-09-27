package views
{
	import flash.display.MovieClip;
	import flash.geom.Rectangle;
	import objects.Bullet;
	import objects.Enemy;
	import objects.Personaje;
	import utils.Collision.QuadTree;
	import utils.DTempo;
	import utils.input.Dkeyboard;
	import utils.loader.DLoader;
	import utils.objects.DGameObject;
	import utils.objects.DGroup;
	import utils.states.Dstate;
	import utils.states.DstateManager;
	
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Game extends Dstate
	{
		private var elapsed:Number = 0;
		private var hero:Personaje;
		private var quadtree:QuadTree;
		private var puntaje:int = 0;
		private var enemyGroup:DGroup;
		private var bulletGroup:DGroup;
		private var elapsedBullet:Number = 0;
		
		public function Game()
		{
			super('mc_background', true);
		}
		
		override public function init():void
		{
			super.init();
			hero = new Personaje();
			hero.x = 150;
			hero.y = 450;
			addChild(hero);
			enemyGroup = new DGroup();
			addChild(enemyGroup);
			enemyGroup.createMultiple(20, Enemy, 'skin_enemy');
			bulletGroup = new DGroup();
			addChild(bulletGroup);
			bulletGroup.createMultiple(20, Bullet, 'skin_hero');
			Dkeyboard.init(stage);
		}
		
		override public function update():void
		{
			super.update();
			elapsed += DTempo.dt;
			elapsedBullet += DTempo.dt;
			
			if (elapsed >= 1)
			{
				elapsed = 0;
				var enemy:Enemy = enemyGroup.getFirstDead() as Enemy;
				if (enemy) {
					enemy.reset(Math.random() * stage.stageWidth / 2, 50);
				}else {
					enemy = new Enemy();
					enemy.x = Math.random() * stage.stageWidth / 2;
					enemyGroup.addChild(enemy);
				}
			}
			if (Dkeyboard.space) {
				if (elapsedBullet>=0.5) {
					elapsedBullet = 0;
					var bullet:Bullet = bulletGroup.getFirstDead() as Bullet;
					if (bullet) {
						bullet.reset(hero.x, hero.y);
					}else {
						bullet = new Bullet('skin_hero', hero.x, hero.y);
						bulletGroup.addChild(bullet);
					}
				}
			}
			
			for (var j:int = 0; j < bulletGroup.numChildren; j++) 
			{
				var m:Bullet = bulletGroup.getChildAt(j) as Bullet;
				m.update();
			}
			
			for (var i:int = 0; i < enemyGroup.numChildren; i++) 
			{
				var mc:Enemy = enemyGroup.getChildAt(i) as Enemy;
				for (var k:int = 0; k < bulletGroup.numChildren; k++) 
				{
					var b:Bullet = bulletGroup.getChildAt(k) as Bullet;
					if (mc.hitBmd(b)) {
						trace('aaa');
						mc.kill();
						b.kill();
					}
				}
				if (mc.hitBmd(hero)) {
					//hero.hurt();
					//mc.kill();
				}
				mc.update();
			}
			hero.update();
		}
	}

}