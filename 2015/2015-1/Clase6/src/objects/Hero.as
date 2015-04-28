package objects 
{
	import utils.DGameObject;
	import utils.DKeyboard;
	
	/**
	 * ...
	 * @author 
	 */
	public class Hero extends DGameObject 
	{
		
		public function Hero() 
		{
			super();
			currentClip = "skin_hero";
		}
		
		override public function init():void {
			super.init();
			x = stage.stageWidth / 2;
			y = stage.stageHeight / 2;
		}
		
		override public function update():void {
			if (DKeyboard.upPress) {
				y -= 5;
			}
			if (DKeyboard.downPress) {
				y += 5;
			}
			super.update();
		}
		
	}

}