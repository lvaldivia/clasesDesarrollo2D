package views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game2 extends Sprite
	{
		private var character:Sprite;
		private var left_pressed:Boolean;
		private var right_pressed:Boolean;
		private var up_pressed:Boolean;
		private var vy:Number;
		private var vx:Number;
		public function Game2() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var c:Class = Global.assets.getDefinition('hero') as Class;
			character = new c();
			addChild(character);
			vx = 0;
			vy = 0;
			character.y = 100;
			character.x = 150;
			stage.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyup);
		}
		
		private function loop(e:Event):void 
		{
			if(left_pressed){
				character.rotation += 5;
			}
			if (right_pressed) {
				character.rotation -= 5;
			}
		}
		
		private function keyup(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					left_pressed = false;
				break;
				case Keyboard.RIGHT:
					right_pressed = false;
				break;
				case Keyboard.UP:
					up_pressed = false;
				break;
			}
		}
		
		private function keydown(e:KeyboardEvent):void 
		{
			trace(e.keyCode);
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					left_pressed = true;
				break;
				case Keyboard.RIGHT:
					right_pressed = true;
				break;
				case Keyboard.UP:
					up_pressed = true;
				break;
			}
		}
	}

}