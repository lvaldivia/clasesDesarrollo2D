package utils.states
{
	//import com.greensock.TweenLite;
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
		
		public static function init(_parent:Sprite):void
		{
			states = new Dictionary();
			parent = _parent;
		}
		
		public static function register(key:String, value:Class):void
		{
			states[key] = value;
		}
		
		public static function start(key:String, anim:Boolean = false):void
		{
			if (current != null && anim)
			{
				//TweenLite.to(old, 1, {x: old.width, onComplete: removeOld});
			}
			if(current!=null && !anim)
			{
				parent.removeChild(current);
			}

			try 
			{
				current = new states[key]();
				parent.addChild(current);
				if (anim)
				{
					current.x = -current.width;
					//TweenLite.to(current, 1, {x: 0});
				}
			}catch(e:Error){
				trace("The state " + key + " is not defined");
			}
			
		}
		
		static private function removeOld():void
		{
			parent.removeChild(old);
			old = null;
		}
	
	}

}