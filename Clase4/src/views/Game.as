package src.views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import src.events.GameEvent;
	import src.objects.Enemy;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		private var currenTime:int;
		private var tiempoAparecer:Number;
		private var totalTiempo:Number;
		private var enemigos:Vector.<Enemy>;
		private var muertos:int;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			currenTime = getTimer();
			muertos = 0;
			totalTiempo = 1;
			tiempoAparecer = 0;
			enemigos = new Vector.<Enemy>();
			stage.addEventListener(Event.ENTER_FRAME, loop);
			addEventListener(GameEvent.GAME_KILL_MONSTER, onGameKill);
		}
		
		private function onGameKill(e:GameEvent):void 
		{
			if (muertos < 3) {
				trace("muertos");
				muertos++;
			}else {
				this.dispatchEvent(new GameEvent(GameEvent.GAME_WIN,true));
			}
		}
		
		private function loop(e:Event):void 
		{
			var t:Number = getTimer();
			var dt:Number = (t - currenTime) * 0.001;
			currenTime = getTimer();
			tiempoAparecer += dt;
			if (tiempoAparecer >= totalTiempo) {
				tiempoAparecer = 0;
				var enemy:Enemy = new Enemy();
				addChild(enemy);
				enemigos.push(enemy);
				//trace("crea monstruo");
			}
			if (enemigos.length > 0) {
				var lng:int = enemigos.length;
				for (var i:int = 0; i < lng; i++) 
				{
					enemigos[i].update(dt);
				}
			}
		}
		
	}

}