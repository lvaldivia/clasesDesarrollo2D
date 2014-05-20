package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import src.events.GameEvents;
	import src.objects.Monster;
	import src.objects.Aim;
	import com.greensock.TweenLite;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		private var aim:Aim;
		private var enemies_level:Vector.<int>;
		private var current_enemies:int;
		private var timer:Timer;
		private var current_level:int;
		private var deads:int;
		private var layer1:Sprite;
		private var layer2:Sprite;
		private var msgWave:MovieClip;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function showMsg():void {
			msgWave = new wave();
			msgWave.x = stage.stageWidth;
			msgWave.y = stage.stageHeight/2;
			msgWave.txt.text = "Wave "+ (current_level+1);
			addChild(msgWave);
			TweenLite.to(msgWave, 0.5, { x:stage.stageWidth / 2,onComplete:comenzar } );
		}
		
		private function comenzar():void 
		{
			msgWave.alpha = 0;
			removeChild(msgWave);
			timer.start();
		}
		
		private function addedToStage(e:Event):void 
		{
			current_level = 0;
			deads = 0;
			enemies_level = new Vector.<int>();
			enemies_level.push(5,10);
			current_enemies = 0;
			layer1 = new Sprite();
			layer2 = new Sprite();
			addChild(layer2);
			addChild(layer1);
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			//timer.start();
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			aim = new Aim();
			layer1.addChild(aim);
			//Mouse.hide();
			showMsg();
			stage.addEventListener(MouseEvent.MOUSE_MOVE, moveAim);
			addEventListener(GameEvents.MONSTER_KILLED, killedMonster);
		}
		
		private function killedMonster(e:GameEvents):void 
		{
			if (deads < enemies_level[current_level]) {
				deads++;
				if (deads == enemies_level[current_level]) {
					while (layer2.numChildren>0) 
					{
						layer2.removeChildAt(0);
					}
					deads = 0;
					current_level++;
					timer.stop();
					showMsg();
					
				}
			}
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			if (current_enemies < enemies_level[current_level]) {
				var monster:Monster = new Monster();
				monster.x = Math.random() * stage.stageWidth;
				monster.y = Math.random() * stage.stageHeight;
				current_enemies++;
				layer2.addChild(monster);
			}
		}
		
		private function moveAim(e:MouseEvent):void 
		{
			//aim.x = mouseX;
			//aim.y = mouseY;
		}
		
	}

}