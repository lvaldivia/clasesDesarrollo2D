package utils 
{
	/**
	 * ...
	 * @author 
	 */
	public class DMath 
	{
		static public function radiansToDegrees(value:Number):Number {
			return value * Math.PI/180;
		}
		
		static public function randRange(minNum:Number, maxNum:Number):Number 
        {
            return (Math.floor(Math.random() * (maxNum - minNum + 1)) + minNum);
        }
	}

}