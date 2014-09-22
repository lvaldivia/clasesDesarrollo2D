package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class NavigationEvent extends Event 
	{
		public static const CHANGE_VIEW:String = 'changeView';
		public var props:Object;
		public function NavigationEvent(type:String, _props:Object ,bubbles:Boolean=true, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			props = _props;
		}
		
	}

}