package 
{
import flash.display.Sprite;
import flash.events.Event;


public class Enemy extends Sprite
    {
        private var _main:Main;
        
        public function Enemy() 
        {
			addEventListener(Event.ADDED_TO_STAGE, added);
        }
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			 graphics.lineStyle(2, 0xff0000, 1);
            graphics.beginFill(0xffffff, 1);
            graphics.drawRect(-25, -25, 50, 50);
            graphics.endFill();
            
            //addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
        
        public function destroy():void
        {
            removeEventListener(Event.ENTER_FRAME, onEnterFrame);
           parent.removeChild(this);
        }
		
		public function move():void {
			x -= 2;
		}
        
        private function onEnterFrame(e:Event):void
        {
            //this.x -= 2;
        }
        
    }

}