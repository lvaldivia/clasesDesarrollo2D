package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	/**
	 * ...
	 * @author
	 */
	public class Game extends Sprite
	{
		private var container:Sprite;
		private var choque:Boolean;
		private var dir:int = 1;
		private var ship:Sprite;
		private var rightPress:Boolean;
		private var leftPress:Boolean;
		
		public function Game()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			var column:int = 0;
			var row:int = -1;
			container = new Sprite();
			addChild(container);
			
			for (var i:int = 0; i < 24; i++) 
			{
				var cuac:Sprite = new Sprite();
				cuac.graphics.beginFill(Math.random()*0x0000A0);
				cuac.graphics.drawRect(0, 0, 50, 50);
				cuac.graphics.endFill();
				container.addChild(cuac);
				column = i % 8;
				if (column == 0) {
					row++;
				}
				cuac.x = column * (cuac.width + 10);
				cuac.y = row * (cuac.height + 10);
			}
			ship = new Sprite();
			ship.graphics.beginFill(Math.random()*0x8080C0);
			ship.graphics.drawRect(0, 0, 50, 50);
			ship.graphics.endFill();
			addChild(ship);
			ship.x = (stage.stageWidth / 2) - ship.width;
			ship.y = stage.stageHeight - ship.height;
			addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.LEFT:
					leftPress = false;
				break;
				case Keyboard.RIGHT:
					rightPress = false;
				break;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			switch(e.keyCode) {
				case Keyboard.LEFT:
					leftPress = true;
				break;
				case Keyboard.RIGHT:
					rightPress = true;
				break;
			}
		}
		
		private function loop(e:Event):void 
		{
			container.x += dir*5;
			if (container.x >= stage.stageWidth - container.width)
			{
				dir = -1;
				container.y += 5;
			}
			else if (container.x <= 0)
			{
				dir = 1;
				container.y += 5;
			}
			if (leftPress) {
				ship.x -= 10;
			}
			if (rightPress) {
				ship.x += 10;
			}
			if (ship.x < -ship.width) {
				ship.x = stage.stageWidth;
			}
			if (ship.x > stage.stageWidth ) {
				ship.x = -ship.width;
			}
		}
	
	}

}