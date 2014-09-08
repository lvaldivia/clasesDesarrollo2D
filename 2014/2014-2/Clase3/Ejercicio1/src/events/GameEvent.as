package events 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class GameEvent extends Event 
	{
		public static var CHANGE_VIEW:String = 'changeView';
		public var _view:String;
		public function GameEvent(type:String, view:String , bubbles:Boolean = true, cancelable:Boolean = false) 
		{
			super(type, bubbles, cancelable);
			_view = view;
		}
		
	}

}