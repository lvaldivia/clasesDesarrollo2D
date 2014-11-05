package  
{
	import flash.ui.Keyboard;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite 
	{
		private var hero:MovieClip;
		private var btn:Button;
		private var btn_2:Button;
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var quad:Quad = new Quad(100, 50,0xFF00FF);
			quad.x = 50;
			quad.y = 50;
			addChild(quad);
			var bg:Image = new Image(Assets.getAtlas().getTexture("background.png"));
			addChild(bg);
			
			btn = new Button(Assets.getTexture("start_btn"));
			addChild(btn);
			btn.name = 'btn1';
			
			btn_2 = new Button(Assets.getAtlas().getTexture("stop_button.png"));
			btn_2.name = 'btn2';
			addChild(btn_2);
			btn_2.x = 100;
			
			hero = new MovieClip(Assets.getAtlas().getTextures("walking_guy00"));
			//addChild(hero);
			//Starling.juggler.add(hero);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			stage.addEventListener(Event.TRIGGERED, onTrigger);
		}
		
		private function onTrigger(e:Event):void 
		{
			var btn:Button = e.target as Button;
			if (btn.name == 'btn1') {
				dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE));
			}else {
				//goIntro
			}
		}
		
		private function keyUp(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					
				break;
			}
		}
		
		private function keyDown(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.LEFT:
					hero.x -= 2;
				break;
				case Keyboard.RIGHT:
					hero.x += 2;
				break;
				
			}
		}
		
	}

}