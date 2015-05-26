package 
{
	import flash.geom.Point;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Coin extends DGameObject 
	{
		private var posX:int;
		private var posY:int;
		public function Coin(pX:int, pY:int) 
		{
			super();
			posX = pX;
			posY = pY;
			currentClip = 'coin';
		}
		
		override public function init():void {
			super.init();
			x = posX * width;
			y = posY * height;
		}
		
		public function getPos():Point {
			return new Point(x, y);
		}
		
	}

}