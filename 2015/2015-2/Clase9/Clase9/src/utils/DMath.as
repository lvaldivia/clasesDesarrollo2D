package utils 
{
	/**
	 * ...
	 * @author l
	 */
	public class DMath 
	{
		
		public static function randomRange(minNum:Number, maxNum:Number):Number
		{
			return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
		}
		
	}

}