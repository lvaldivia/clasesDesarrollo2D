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
		private var mWidth:int;
		private var mHeight:int;
		private var currentMap:Array;
		private var hero:Sprite;
		private var posX:int;
		private var posY:int;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var pathMap:Array=[
				0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,1,0,
				0,0,0,0,0,0,1,1,1,0,0,0,0,1,0,0,0,0,1,0,
				0,0,1,1,1,1,1,0,0,0,0,0,0,1,0,0,0,0,0,0,
				0,0,0,0,0,0,1,0,1,1,1,1,0,1,0,1,1,1,1,0,
				1,1,1,0,0,0,1,0,0,0,0,1,0,1,0,1,0,0,0,0,
				0,0,0,0,0,0,1,1,1,0,0,1,0,0,0,1,0,0,1,1,
				0,0,0,0,0,0,1,0,0,0,0,1,0,0,1,1,1,0,1,0,
				0,0,1,0,0,0,0,0,0,0,0,1,0,0,1,0,1,0,0,0,
				0,0,1,0,0,0,0,1,1,1,1,1,1,1,1,0,1,0,0,0,
				0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
			mWidth = 20;
			mHeight = 10;
			currentMap = getArray(mWidth, mHeight, pathMap);
			
			drawMap();
		}
		
		private function drawMap():void 
		{
			var contentMap:Sprite = new Sprite();
			for (var i:int = 0; i < mWidth; i++) 
			{
				for (var j:int = 0; j < mHeight; j++) 
				{
					
					if (currentMap[i][j] == 0) {
						contentMap.graphics.beginFill(0x00FF00);
					}else {
						contentMap.graphics.beginFill(0xFF00FF);
					}
					contentMap.graphics.drawRect(i * 25, j * 25, 25, 25);
					
				}
				contentMap.graphics.endFill();
			}
			addChild(contentMap);
			hero = new Sprite();
			hero.graphics.beginFill(0xFF0012);
			hero.graphics.drawRect(0, 0, 25, 25);
			hero.graphics.endFill();
			addChild(hero);
			posX = 0;
			posY = 0;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, down);
			stage.addEventListener(KeyboardEvent.KEY_UP, up);
		}
		
		private function up(e:KeyboardEvent):void 
		{
			
		}
		
		private function down(e:KeyboardEvent):void 
		{
			var pX:int = posX;
			var pY:int = posY;
			switch (e.keyCode) 
			{
				case Keyboard.RIGHT:
					pX++;
				break;
				case Keyboard.LEFT:
					pX--;
				break;
				case Keyboard.UP:
					pY--;
				break;
				case Keyboard.DOWN:
					pY++;
				break;
			}
			if (pX<0) {
				pX = 0;
			}
			if (pX >= mWidth - 1) {
				pX = mWidth - 1;
			}
			if (pY<0) {
				pY = 0;
			}
			if (pY >= mHeight - 1) {
				pY = mHeight - 1;
			}			
			if (currentMap[pX][pY] == 0) {
				posX = pX;
				posY = pY;
				hero.x = pX*25;
				hero.y = pY*25;
			}
		}
		
		private function getArray(width:int, height:int, matrix:Array):Array {
			var map:Array = new Array(width);
			for (var i:int = 0; i < width; i++) 
			{
				map[i] = new Array(height);
				for (var j:int = 0; j < height; j++) 
				{
					map[i][j] = matrix[i + j * width];
				}
			}
			return map;
		}
		
	}

}