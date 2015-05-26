package 
{
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Tile extends DGameObject 
	{
		private var posX:int;
		private var posY:int;
		public function Tile(pX:int, pY:int, type:int) 
		{
			super();
			if (type == 0) {
				currentClip = 'empty';
			}else {
				currentClip = 'columna';
			}
			posX = pX;
			posY = pY;
		}
		
		override public function init():void {
			super.init();
			x = posX * width;
			y = posY * height;
		}
		
	}

}