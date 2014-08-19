package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.getTimer;
	import src.events.GameEvent;
	import src.events.NavigationEvent;
	import src.objects.Monster;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class GameView extends Sprite 
	{
		private var _bg:MovieClip;
		
		private var _firstTime:Number;
		private var _countingTime:Number = 0;
		private var _deltaTime;
		
		private var _enemies:Vector.<Monster>;
		private var _enemiesKilled:int = 0;
		
		public function GameView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_bg = new game_view();
			addChild(_bg);
			
			_firstTime = getTimer();
			
			_enemies = new Vector.<Monster>();
			
			addEventListener(Event.ENTER_FRAME, update);
			addEventListener(GameEvent.MONSTER_DOWN, monsterDown);
		}
		
		private function monsterDown(e:GameEvent):void 
		{
			_enemiesKilled++;
			if (_enemiesKilled >= 6) {
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, {view:"win_view"}, true));
			}
		}
		
		private function update(e:Event):void 
		{
			var _secondTime = getTimer();
			_deltaTime = (_secondTime - _firstTime);
			_firstTime = getTimer();
			
			_countingTime += _deltaTime;
			
			if (_countingTime >= 1000) {
				_countingTime = 0;
				
				var monster:Monster = new Monster();
				addChild(monster);
				_enemies.push(monster);
			}
			
			if (_enemies.length > 0) {
				for (var i:int = 0; i < _enemies.length; i++) 
				{
					_enemies[i].update(_deltaTime);
				}
			}
		}
		
	}

}