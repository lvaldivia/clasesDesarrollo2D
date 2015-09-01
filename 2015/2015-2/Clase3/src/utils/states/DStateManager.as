package utils.states 
{
	import com.greensock.TweenLite;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DStateManager 
	{
		private static var states:Dictionary;
		private static var parent:Sprite;
		private static var current:DState;
		private static var old:DState;
		
		public static function init(_parent:Sprite):void {
			states = new Dictionary();
			parent = _parent;
		}
		
		public static function register(key:String,
				value:Class):void {
			states[key] = value;
		}
		
		public static function start(key:String):void {
			if (current != null) {
				old = current;
				TweenLite.to(old, 1, { x: old.width,onComplete:removeOld } );
				
			}
			current = new states[key] ();
			parent.addChild(current);
			current.x = -current.width;
			TweenLite.to(current, 1, { x:0 } );
			
		}
		
		static private function removeOld():void 
		{
			parent.removeChild(old);
		}
		
	}

}