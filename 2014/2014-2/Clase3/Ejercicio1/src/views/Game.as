package views 
{
	import events.GameEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var left_pressed:Boolean;
		private var right_pressed:Boolean;
		private var space_pressed:Boolean;
		private var is_jumping:Boolean;
		private var character:Sprite;
		private var acceleration:Number;
		private var vel:Number;
		private var jump_power:Number = 20;
		private var gravity:Number = 10;
		private var floor:Number;
		private var friction:Number;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			left_pressed = false;
			right_pressed = false;
			space_pressed = false;
			is_jumping = false;
			acceleration = 0.5;
			vel = 0;
			friction = 0.91;
			var c:Class = Global.assets.getDefinition('hero') as Class;
			character = new c();
			addChild(character);
			character.x = 100;
			floor = 450;
			character.y = floor;
			stage.focus = stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keydown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyup);
			stage.addEventListener(Event.ENTER_FRAME, loop);
			setTimeout(goNext, 1500);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keydown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyup);
			stage.removeEventListener(Event.ENTER_FRAME, loop);
			removeChild(character);
		}
		
		private function goNext():void 
		{
			dispatchEvent(new GameEvent(GameEvent.CHANGE_VIEW, 'game2'));
		}
		
		private function loop(e:Event):void 
		{
			if (left_pressed) {
				vel += acceleration;
				vel *= friction;
				character.x -= vel;
			}
			if (right_pressed) {
				vel += acceleration;
				vel *= friction;
				character.x += vel;
			}
			if (space_pressed) {
				if (!is_jumping) {
					is_jumping = true;
				}
			}
			if (is_jumping) {
				character.y -= jump_power;
				jump_power -= 1;
				character.rotation -= 20;
				if (character.y >= floor) {
					is_jumping = false;
					character.rotation = 0;
					jump_power = 30;
				}
			}
			if (character.x >= stage.stageWidth-(character.width/2) ) {
				character.x = stage.stageWidth - (character.width/2);
			}
			if (character.x <= character.width / 2) {
				character.x = character.width / 2;
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
				case Keyboard.SPACE:
					space_pressed = false;
				break;
			}
		}
		
		private function keydown(e:KeyboardEvent):void 
		{
			switch(e.keyCode)
			{
				case Keyboard.LEFT:
					left_pressed = true;
					character.scaleX = 1;
				break;
				case Keyboard.RIGHT:
					right_pressed = true;
					character.scaleX = -1;
				break;
				case Keyboard.SPACE:
					space_pressed = true;
				break;
			}
		}
		
	}

}