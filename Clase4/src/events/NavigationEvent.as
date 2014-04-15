package src.events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class NavigationEvent extends Event 
	{
		public var params:Object;
		public static var CHANGE_VIEW:String = "onChangeView";
		public function NavigationEvent(type:String, _params:Object,bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			params = _params;
		}
		
	}

}