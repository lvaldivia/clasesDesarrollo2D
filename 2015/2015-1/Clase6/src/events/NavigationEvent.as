package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = "changeView";
		public var _view:String;
		public function NavigationEvent(type:String, view:String ,bubbles:Boolean=true, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			_view = view;
		}
		
	}

}