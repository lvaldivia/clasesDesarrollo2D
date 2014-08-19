package src.events
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ...
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = "changeView";
		
		public function NavigationEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}

}