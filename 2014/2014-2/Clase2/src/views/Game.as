package views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Sprite = new Sprite();
			c.graphics.beginFill(0xFF000F);
			c.graphics.drawRect(0, 0, 50, 50);
			c.graphics.endFill();
			addChild(c);
			
		}
		
	}

}