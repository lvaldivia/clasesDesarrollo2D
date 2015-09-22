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
		public function Bullet(posX:Number,posY:Number) 
		{
			pX = posX;
			pY = posY;
			super ('skin_hero');
		}
		
		override public function init():void{
			super.init();
			scaleX = scaleY = 0.2;
			x = pX;
			y = pY;
		}
		
		
		override public function update():void{
			super.init();
			y -= 2;
		}
	}

}