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
			
			enemys = new Vector.<Enemy>();
			
			Dkeyboard.init(stage);
			quadtree = new QuadTree(0, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight), stage);
		
		}
		
		override public function update():void
		{
			super.update();
			quadtree.clear();
			elapsed += DTempo.dt;
			
			if (elapsed >= 1)
			{
				elapsed = 0;
				var enemy:Enemy = new Enemy();
				
				addChild(enemy);
				enemy.x = Math.random() * stage.stageHeight / 2;
				
				enemys.push(enemy);
				
			}
		}
	}

}