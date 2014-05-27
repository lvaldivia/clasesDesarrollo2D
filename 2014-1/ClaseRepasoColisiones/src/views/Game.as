package src.views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.getTimer;
	import flash.utils.Timer;
	import src.objects.Enemy;
	import src.objects.Slots;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		private var slotsVector:Vector.<Slots>;
		private var current:int;
		private var monstruoApareceer:Number;
		private var enemies:Vector.<Enemy>;
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			monstruoApareceer = 0;
			stage.addEventListener(Event.ENTER_FRAME, loop);
			current = getTimer();
			slotsVector = new Vector.<Slots>();
			var posY:Number = 0;
			enemies = new Vector.<Enemy>();
			for (var i:int = 0; i < 20; i++) 
			{
				var tmp:Slots = new Slots();
				addChild(tmp);
				tmp.x = ((i%5) * (tmp.width+20)) + 70;
				if (i % 5 == 0) {
					posY += 100;
				}
				tmp.y = posY;
				slotsVector.push(tmp);
			}
		}
		
		private function randRange(minNum:Number, maxNum:Number):Number 
        {
            return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
        }
		
		private function loop(e:Event):void 
		{
			var dt:Number = (getTimer() - current) * 0.001;
			current = getTimer();
			monstruoApareceer += dt;
			if (monstruoApareceer >= 1) {
				monstruoApareceer = 0;
				var tmp:Enemy = new Enemy();
				var indice:int = (Math.random() * slotsVector.length - 1);
				addChild(tmp);
				tmp.y = slotsVector[indice].y;
				enemies.push(tmp);
				tmp.x =stage.stageWidth+(enemies[enemies.length-1].width);
				
			}
			if (enemies.length > 0) {
				for (var i:int = 0; i < enemies.length; i++) 
				{
					enemies[i].x -= 5;
					for (var j:int = 0; j < slotsVector.length; j++) 
					{
						slotsVector[j].update(enemies[i].x,enemies[i].y);
					}
				}
				
			}
			
		}
		
	}

}