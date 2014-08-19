package src.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class GameEvent extends Event 
	{
		public static const MONSTER_DOWN:String = "monsterDown";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}