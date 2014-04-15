package src.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class GameEvent extends Event 
	{
		public static var GAME_WIN:String = "gameWin";
		public static var GAME_KILL_MONSTER:String = "gameKillMonster";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}