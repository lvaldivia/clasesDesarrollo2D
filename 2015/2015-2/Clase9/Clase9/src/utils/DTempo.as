package utils 
{
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DTempo 
	{
		public static var dt:Number;
		public static var current:Number;
		public static function init():void {
			dt = 0;
			current = getTimer();
		}
		
		public static function update():void {
			dt = (getTimer() - current) * 0.001;
			current = getTimer();
		}
		
	}

}