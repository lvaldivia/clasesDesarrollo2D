package objects 
{
	import utils.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Bullet extends DGameObject 
	{
		private var posX:Number;
		private var posY:Number;
		public function Bullet(pX:Number,py:Number) 
		{
			super();
			posX = pX;
			posY = py;
			currentClip = "bullet";
		}
		
		override public function init():void {
			x = posX;
			y = posY;
			super.init();
		}
		
		override public function update():void {
			x -= 2;
			if (x < -width / 2) {
				outOfBounds = true;
				parent.removeChild(this);
			}
			super.update();
		}
		
	}

}