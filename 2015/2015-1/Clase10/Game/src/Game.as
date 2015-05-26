package 
{
	import flash.events.Event;
	import utils.input.DKeyboard;
	import utils.loaders.DLoadData;
	import utils.views.DView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Game extends DView 
	{
		private var map:Array;
		private var hero:Hero;
		private var row:int;
		private var colum:int;
		
		public function Game() 
		{
			super();
			
		}
		
		override public function init():void {
			super.init();
			DLoadData.load("map.json");
			DLoadData.onComplete = parse;
		}
		
		private function parse(obj:Object):void {
			map = new Array();
			for (var i:int = 0; i < obj.map.length; i++) 
			{
				map[i] = new Array();
				for (var j:int = 0; j < obj.map[i].length ; j++) 
				{
					
					var t:Tile = new Tile(i, j, obj.map[i][j]);
					addChild(t);
					map[i].push(obj.map[i][j]);
				}
			}
			hero = new Hero();
			addChild(hero);
			row = 1;
			colum = 1;
			hero.x = row * 50;
			hero.y = colum * 50;
			stage.addEventListener(Event.ENTER_FRAME, loop);
			DKeyboard.init(stage);
		}
		
		private function loop(e:Event):void 
		{
			var tRow:int = row;
			var tCol:int = colum;
			if (DKeyboard.leftPress) {
				DKeyboard.leftPress = false;
				tRow--;
				if (map[tRow][tCol]==0) {
					row = tRow;
					hero.x = row * 50;
					hero.y = colum * 50;
					hero.setState("izquierda");
				}
			}
			if (DKeyboard.rightPress) {
				DKeyboard.rightPress = false;
				tRow++;
				if (map[tRow][tCol]==0) {
					row = tRow;
					hero.x = row * 50;
					hero.y = colum * 50;
					hero.setState("derecha");
				}
			}
			if (DKeyboard.upPress) {
				DKeyboard.upPress = false;
				tCol--;
				if (map[tRow][tCol]==0) {
					colum = tCol;
					hero.x = row * 50;
					hero.y = colum * 50;
					hero.setState("arriba");
				}
			}
			if (DKeyboard.downPress) {
				DKeyboard.downPress = false;
				tCol++;
				if (map[tRow][tCol] == 0) {
					hero.setState("abajo");
					colum = tCol;
					hero.x = row * 50;
					hero.y = colum * 50;
				}
			}
		}
		
	}

}