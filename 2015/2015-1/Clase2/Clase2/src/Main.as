package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private var right:Boolean;
		private var left:Boolean;
		private var monster:Sprite;
		private var speed:Number = 0;
		private var aceleration:Number = 0.2;
		private var maxSpeed:Number = 2;
		private var friction:Number = 0.95;
		private var start:int;
		private var elapsed:Number = 0;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			DLoader.load("assets.swf",goGame);
		}
		
		private function goGame():void {
			monster = new Monster();
			start = getTimer()
			addChild(monster);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, down);
			stage.addEventListener(KeyboardEvent.KEY_UP, up);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			//var timer:Timer = new Timer(500);
			//timer.addEventListener(TimerEvent.TIMER, onTimer);
			//timer.start();
		}
		
		private function onTimer():void 
		{
			var m:Monster2 = new Monster2();
			addChild(m);
			m.x = Math.random() * stage.stageWidth;
		}
		
		private function loop(e:Event):void 
		{
			var dt:Number = (getTimer() - start)*0.001;
			start = getTimer();
			elapsed += dt;
			trace(elapsed);
			if (elapsed >= 1) {
				onTimer();
				elapsed = 0;
			}
			if (left) {
				speed -= aceleration;
				if (speed < -maxSpeed) {
					speed = -maxSpeed;
				}
			}
			if (right) {
				speed += aceleration;
				if (speed > maxSpeed) {
					speed = maxSpeed;
				}
			}
			speed *= friction;
			monster.x += speed;
			//if (monster.x < 0) {
				//monster.x = 0;
			//}
			//if (monster.x > stage.stageWidth - monster.width) {
				//monster.x = stage.stageWidth - monster.width;
			//}
		}
		
		private function down(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = true;
				break;
				case Keyboard.RIGHT:
					right = true;
				break;
				
			}
		}
		
		private function up(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left = false;
				break;
				case Keyboard.RIGHT:
					right = false;
				break;
				
			}
		}
		
	}
	
}