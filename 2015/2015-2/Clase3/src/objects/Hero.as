package objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.input.DKeyboard;
	import utils.loader.DLoader;
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Hero extends DGameObject
	{
		
		public function Hero() 
		{
			super("skin_hero");
		}
		
		override public function update():void {
			super.update();
			if (DKeyboard.left) {
				x -= 2;
				if (scaleX != 1) {
					scaleX = 1;
				}
			}
			if (DKeyboard.right) {
				if (scaleX != -1) {
					scaleX = -1;
				}
				x += 2;
			}
		}
		
		
		
	}

}