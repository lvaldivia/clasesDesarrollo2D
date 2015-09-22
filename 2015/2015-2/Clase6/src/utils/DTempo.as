package utils 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class DTempo 
	{
		public static var dt:Number;
		private static var elapsed:Number;
		private static var current:Number;
		
		public static function init():void
		{
		 dt = 0;
		 elapsed = 0;
		 current = getTimer();
		 
		}
		
		public static function update():void 
		{
			dt = (getTimer()- current) * 0.001;
			current = getTimer();
		}
		
	}

}