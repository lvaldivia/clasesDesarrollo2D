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
		private var enemys:Vector.<Enemy>;
		private var quadtree:QuadTree;
		private var puntaje:int = 0;
		private var elapsed2:Number = 0;
		private var bullets:Vector.<Bullet>;
		private var enemyGroup:DGroup;
		
		public function Game()
		{
			super('mc_background', true);
		}
		
		override public function init():void
		{
			super.init();
			bullets = new Vector.<Bullet>();
			hero = new Personaje();
			hero.x = 150;
			hero.y = 450;
			addChild(hero);
			enemyGroup = new DGroup();
			addChild(enemyGroup);
			enemyGroup.createMultiple(20, Enemy, 'skin_enemy');
			Dkeyboard.init(stage);
		}
		
		override public function update():void
		{
			super.update();
			elapsed += DTempo.dt;
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
			for (var i:int = 0; i < enemyGroup.numChildren; i++) 
			{
				var mc:Enemy = enemyGroup.getChildAt(i) as Enemy;
				if (mc.hitBmd(hero)) {
					hero.hurt();
					mc.kill();
				}
				mc.update();
			}
			hero.update();
		}
	}

}