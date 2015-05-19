package game.views 
{
	import flash.events.Event;
	import game.manager.ObjectManager;
	import game.objects.Hero;
	import utils.input.DKeyboard;
	import utils.input.DMouse;
	import utils.objects.DGameObject;
	import utils.time.DTempo;
	import utils.views.DView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Game extends DView 
	{
		private var hero:Hero;
		private var manager:ObjectManager;
		private var elapsedCreation:Number = 0;
		
		public function Game() 
		{
			super();
		}
		
		override public function init():void {
			super.init();
			DMouse.init(stage);
			manager = new ObjectManager(this);
			DTempo.start();
			DKeyboard.init(stage);
			hero = new Hero();
			addChild(hero);
			manager.setHitTarget(hero);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
			DTempo.update();
			elapsedCreation += DTempo.dt;
			if (elapsedCreation >= 0.8) {
				elapsedCreation = 0;
				manager.addEnemy();
			}
			manager.update();
		}
		
	}

}