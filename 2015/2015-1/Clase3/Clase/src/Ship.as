package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DKeyboard;
	import utils.DLoader;
	
	/**
	 * ...
	 * @author 
	 */
	public class Ship extends Sprite 
	{
		private var skin:Sprite;
		
		public function Ship() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = DLoader.getAsset("ship") as Class;
			skin = new c();
			addChild(skin);
			x = stage.stageWidth / 2;
			y = stage.stageHeight / 2;
		}
		
		public function update():void 
		{
			if (DKeyboard.leftPress) {
				rotation -= 1;
			}
			if (DKeyboard.rightPress) {
				rotation += 1;
			}
		}
		
	}

}