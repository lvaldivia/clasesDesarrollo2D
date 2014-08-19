package src.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class GameEvents extends Event 
	{
		public static var MONSTER_KILLED:String = "monsterKilled";
		public function GameEvents(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
		}
		
	}

}