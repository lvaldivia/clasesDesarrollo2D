package views 
{
	import flash.display.MovieClip;
	import objects.Enemy;
	import utils.loader.DLoader;
	import utils.states.DState;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DState
	{
	
		public function Game() 
		{
			super("mc_background");
		}
		
		override public function init():void {
			super.init();
			var enemy:Enemy = new Enemy();
			enemy.x = 150;
			enemy.y = 150;
			addChild(enemy);
		}
		
	}

}