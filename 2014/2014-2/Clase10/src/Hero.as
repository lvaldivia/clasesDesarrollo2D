package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Luis
	 */
	 public class Hero extends Sprite
    {
        private var unitSprite:Sprite;
        
        public function Hero() 
        {
            addEventListener(Event.ADDED_TO_STAGE, added);
        }
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
            graphics.lineStyle(2, 0x00ff00, 1);
            graphics.beginFill(0xffffff, 1);
            graphics.drawRect(-30, -30, 60, 60);
            graphics.endFill();
		}
		
	}

}