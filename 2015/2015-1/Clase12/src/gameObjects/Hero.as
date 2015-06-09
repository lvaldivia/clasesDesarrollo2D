package gameObjects 
{
	import utils.input.DKeyboard;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Hero extends DGameObject 
	{
		private var grav:int = 0;
		private var isJumping:Boolean;
		public function Hero() 
		{
			super();
		}
		
		override public function init():void {
			graphics.beginFill(0);
			graphics.drawCircle(0, 0, 25);
			graphics.endFill();
		}
		
		override public function update():void {
			super.update();
			y += grav;
			if (y + (height / 2) < floor) {
				grav++;
			}else {
				grav = 0;
				isJumping = false;
				y = floor - (height / 2);
			}
			if (DKeyboard.leftPress) {
				x -= 15;
			}
			if (DKeyboard.rightPress) {
				x += 15;
			}
			if (DKeyboard.upPress) {
				if (!isJumping) {
					isJumping = true;
					grav = -15;
				}
			}
			if (x - (width / 2) < 0) {
				x = width / 2;
			}
			if (x + (width / 2) > stage.stageWidth) {
				x = stage.stageWidth - (width / 2);
			}
			if (DKeyboard.upPress) {
				
			}
		}
		
	}

}