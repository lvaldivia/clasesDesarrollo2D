package src.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = "viewChanged";
		public var params:Object;
		
		public function NavigationEvent(type:String, p:Object, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			params = p;
		}
		
	}

}