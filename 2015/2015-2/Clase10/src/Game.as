package 
{
	import flash.geom.Rectangle;
	import Utils.input.DKeyboard;
	import Utils.objects.DGroup;
	import Utils.states.DState;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DState 
	{
		private var hero:Hero;
		private var enemyGrup:DGroup;
		
		public function Game() 
		{
			super("fondo",true);
		}
		override public function init():void{
			super.init();
			hero = new Hero();
			addChild(hero);
			DKeyboard.init(stage);
			enemyGrup = new DGroup();
			addChild(enemyGrup);
			for (var i:int = 0; i < 6; i++) 
			{
				var enemy:Enemy = new Enemy(hero);
				enemyGrup.addChild(enemy);
			}
			setUpCamera(hero,new Rectangle(0, 0, 
						Global.map_width, Global.map_height));
		}
		
		override public function update():void {
			super.update();
			hero.update();
			for (var i:int = 0; i < enemyGrup.numChildren; i++) 
			{
				var enemy:Enemy = enemyGrup.getChildAt(i) 
						as Enemy;
				enemy.update();
			}
		}
	}

}