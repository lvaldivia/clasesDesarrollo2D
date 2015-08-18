package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.input.DKeyboard;
	import utils.loader.DLoader;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Hero extends Sprite
	{
		private var skin:MovieClip;
		public function Hero() 
		{
			addEventListener(Event.ADDED_TO_STAGE,added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAsset('hero');
			skin = new c();
			addChild(skin);
			DKeyboard.init(stage);
			x = 150;
			y = 150;
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			if (DKeyboard.left) {
				x -= 1;
				scaleX = -1;
			}
			if (DKeyboard.right) {
				x += 1;
				scaleX = 1;
			}
		}
		
	}

}