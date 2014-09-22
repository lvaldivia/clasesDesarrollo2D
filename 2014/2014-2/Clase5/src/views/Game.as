package views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import objects.Enemy;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var timer:Timer;
		
		public function Game() 
		{
			super();
			//TODO crear una clase base para las vistas y objetos (init,update y destroy)
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			var enemy:Enemy = new Enemy();
			addChild(enemy);
			enemy.x = Math.random() * stage.stageWidth;
			enemy.y = Math.random() * stage.stageHeight;
		}
		
	}

}