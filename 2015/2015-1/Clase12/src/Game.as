package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import gameObjects.Block;
	import gameObjects.Coin;
	import gameObjects.Hero;
	import utils.input.DKeyboard;
	import utils.views.DView;
	
	/**
	 * ...
	 * @author
	 */
	public class Game extends DView
	{
		private var map:Array = [
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
			[1, 0, 2, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0],
			[1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
			[0, 1, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 1, 1]
		];
		private var blocks:Vector.<Block>;
		private var cam:Sprite;
		private var hero:Hero;
		private var coins:Vector.<Coin>;
		
		public function Game()
		{
			super();
		}
		
		override public function init():void
		{
			super.init();
			blocks = new Vector.<Block>();
			cam = new Sprite();
			addChild(cam);
			coins = new Vector.<Coin>();
			for (var i:int = 0; i < map.length; i++)
			{
				for (var j:int = 0; j < map[0].length; j++)
				{
					if (map[i][j] == 1)
					{
						var block:Block = new Block(j * 50 + 25, i * 50 + 25);
						cam.addChild(block);
						blocks.push(block);
					}
					if (map[i][j] == 2) {
						var coin:Coin = new Coin(j * 50 + 25, i * 50 + 25);
						cam.addChild(coin);
						coins.push(coin);
					}
				}
			}
			DKeyboard.init(stage);
			hero = new Hero();
			hero.x = stage.stageWidth/2;
			hero.y = stage.stageHeight/2;
			cam.addChild(hero);
			
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function loop(e:Event):void 
		{
			var prevX:Number = hero.x;
			var prevY:Number = hero.y;
			hero.update();
			for (var i:int = 0; i < blocks.length; i++) 
			{
				blocks[i].check(hero, i);
			}
			var tCoins:int = coins.length;
			for (var j:int = 0; j < tCoins; j++) 
			{
				if (coins[j].hitByPos(hero)) {
					cam.removeChild(coins[j]);
					coins.splice(j, 1);
					tCoins--;
				}
			}
			cam.x -= hero.x - prevX;
			//cam.y -= hero.y - prevY;
		}
	
	}

}