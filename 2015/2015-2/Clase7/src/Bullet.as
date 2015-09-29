package objects 
{
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Bullet extends DGameObject
	{
		
		private var pX:Number;
		private var pY:Number;
		public function Bullet(clip:String='skin_hero',posX:Number = 0,posY:Number = 0) 
		{
			pX = posX;
			pY = posY;
			super (clip);
		}
		
		override public function init():void{
			super.init();
			scaleX = scaleY = 0.2;
			x = pX;
			y = pY;
		}
		
		
		override public function update():void {
			super.update();
			if (isAlive) {
				y -= 2;
				if (y < -height / 2) {
					kill();
				}
			}
			
		}
	}

}