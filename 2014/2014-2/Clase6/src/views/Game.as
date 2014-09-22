package views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import objects.Enemy;
	import objects.Hero;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var timer:Timer;
		private var current:Number;
		private var elapsed:Number;
		private var array:Vector.<Enemy>;
		private var firstTime:Boolean;
		private var hero:Hero;
		public function Game() 
		{
			super();
			//TODO crear una clase base para las vistas y objetos (init,update y destroy)
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			elapsed = 0;
			current = getTimer();
			array = new Vector.<Enemy>();
			hero = new Hero();
			addChild(hero);
		}
		
		private function loop(e:Event):void 
		{
			var dt:Number = (getTimer() - current) * 0.001;
			current = getTimer();
			elapsed += dt;
			if(!firstTime){
				if (elapsed >= 0.5) {
					firstTime = true;
					elapsed = 0;
					var enemy:Enemy = new Enemy();
					addChild(enemy);
					array.push(enemy);
				}
			}
			var childs:int = array.length;
			for (var i:int = 0; i < childs; i++) 
			{
				array[i].update(dt);
				if (array[i].checkBorder(hero.bmdData,hero.p)) {
					removeChild(array[i]);
					array.splice(i, 1);
					childs--;
				}
			}
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			
		}
		
	}

}