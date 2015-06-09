package gameObjects 
{
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Block extends DGameObject 
	{
		private var posX:int;
		private var posY:int;
		public function Block(pX:int, pY:int) 
		{
			super();
			posX = pX;
			posY = pY;
		}
		
		override public function init():void {
			this.graphics.beginFill(0);
			this.graphics.drawRect(x - 25, y - 25, 50, 50);
			this.graphics.endFill();
			x = posX;
			y = posY;
		}
		
		public function check(obj:DGameObject,block:int):void {
			if (obj.x + obj.width/2> x- width/2 && obj.x < x-width/2+7 && Math.abs(obj.y-y)<height/2) {
				obj.x = x - width / 2 - obj.width / 2;
			}
			if (obj.x - obj.width / 2 < x + width / 2 && obj.x > x + width / 2 - 7 && Math.abs(obj.y - y) < height / 2) {
				obj.x = x +width / 2 + obj.width / 2;
			}
			if (Math.abs(obj.x - x) < width/2+ obj.width/2 && obj.y<y-height/2 && obj.floor>y-height/2 && obj.onBlock!=block) {
				obj.floor = y -height / 2;
				obj.onBlock = block;
			}
			if (Math.abs(obj.x-x)>=width/2 + obj.width/2 && obj.onBlock == block) {
				obj.onBlock = -1;
				obj.floor = 450;
			}
			if (obj.y-obj.height/2<y+height/2 && obj.y > y && Math.abs(obj.x-x)<width/2+obj.width/2) {
				obj.y = y +height / 2 + obj.height/2;
			
			}
		}
		
		
		
	
		
	}

}