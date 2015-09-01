package views 
{
	import flash.display.MovieClip;
	import objects.Enemy;
	import objects.Hero;
	import utils.DTempo;
	import utils.input.DKeyboard;
	import utils.objects.DGameObject;
	import utils.states.DState;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends DState
	{
		private var hero:Hero;
		private var elapsed:Number = 0;
		private var enemys:Vector.<Enemy>;
		
		public function Game() 
		{
			super("mc_background",true);
		}
		
		override public function init():void {
			super.init();
			hero = new Hero();
			addChild(hero);
			hero.x = stage.stageWidth / 2;
			hero.y = stage.stageHeight / 2;
			enemys = new Vector.<Enemy>();
			DKeyboard.init(stage);
		}
		
		override public function update():void {
			super.update();
			elapsed += DTempo.dt;
			if (elapsed >= 1) {
				elapsed = 0;
				var enemy:Enemy = new Enemy();
				addChild(enemy);
				enemy.y = 0;
				enemy.x = hero.x;
				enemys.push(enemy);
			}
			hero.update();
			var t:int = enemys.length;
			for (var i:int = 0; i < t; i++) 
			{
				enemys[i].update();
				if (enemys[i].hitPos(hero)) {
					removeChild(enemys[i]);
					enemys.splice(i, 1);
					t--;
				}
			}
		}
		
	}

}