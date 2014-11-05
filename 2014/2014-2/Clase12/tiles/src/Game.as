package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Game extends Sprite
	{
		private var level:Array;
		private var gravity:Number = 1;
		private var tiles:Vector.<Sprite>;
		private var upPress:Boolean;
		private var leftPress:Boolean;
		private var rightPress:Boolean;
		private var hero:Sprite;
		private var can_jump:Boolean;
		private var y_speed:Number=0;
		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			buildMap();
			createHero();
			can_jump = true;
			stage.focus = stage;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, down);
			stage.addEventListener(KeyboardEvent.KEY_UP, up);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			y_speed += gravity;
			if (leftPress) {
				hero.x -= 4;
			}
			if (rightPress) {
				hero.x += 4;
			}
			if (upPress && can_jump) {
				can_jump = false;
				y_speed -= 20; 
			}
			if(y_speed > 10){
				y_speed = 10;
			}
			hero.y += y_speed;
			for(var t:int; t < tiles.length; t++){
				while(tiles[t].hitTestPoint(hero.x,hero.y + 10,true)){
					hero.y -= 1;
					if(y_speed >= 0){									
						can_jump = true;
					}
				}
				while(tiles[t].hitTestPoint(hero.x,hero.y - 10,true)){
					hero.y += 1;
					y_speed = 0;
				}
				while(tiles[t].hitTestPoint(hero.x + 5,hero.y,true)){
					hero.x -= 1;
				}
				while(tiles[t].hitTestPoint(hero.x - 5,hero.y,true)){
					hero.x += 1;
				}
			}
		}
		
		private function up(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.UP:
					upPress = false;
				break;
				case Keyboard.LEFT:
					leftPress = false;
				break;
				case Keyboard.RIGHT:
					rightPress = false;
				break;
			}
		}
		
		private function down(e:KeyboardEvent):void 
		{
			switch (e.keyCode) 
			{
				case Keyboard.UP:
					upPress = true;
				break;
				case Keyboard.LEFT:
					leftPress = true;
				break;
				case Keyboard.RIGHT:
					rightPress = true;
				break;
			}
		}
		
		private function createHero():void 
		{
			hero = new Sprite();
			hero.graphics.beginFill(0x00FF00);
			hero.graphics.drawRect(0, 0, 10, 25);
			hero.graphics.endFill();
			hero.x = 50;
			hero.y = 50;
			addChild(hero);
		}
		
		private function buildMap():void 
		{
			var data:Data = new Data();
			data.Setup();
			level = data.level1;
			tiles = new Vector.<Sprite>();
			for (var i:int = 0; i < level.length; i++) 
			{
				for (var j:int = 0; j < level[i].length; j++) 
				{
					if (level[i][j] == 1) {
						var tile:Sprite = new Sprite();
						tile.graphics.beginFill(0xFF00FF);
						tile.graphics.drawRect(0, 0, 25, 25);
						tile.graphics.endFill();
						tile.x = j * 25;
						tile.y = i * 25;
						addChild(tile);
						tiles.push(tile);
					}
				}
			}
		}
		
	}

}