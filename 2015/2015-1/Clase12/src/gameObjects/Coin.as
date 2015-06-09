package gameObjects 
{
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
		}
		
		
		override public function init():void {
			graphics.beginFill(0xFFFF5B);
			graphics.drawCircle(0, 0, 10);
			graphics.endFill();
			x = posX;
			y = posY;
		}
	}

}