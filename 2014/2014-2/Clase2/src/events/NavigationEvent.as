package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = "changeView";
		public var next:String;
		public function NavigationEvent(type:String,next_view:String ,bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			next = next_view;
		}
		
	}

}