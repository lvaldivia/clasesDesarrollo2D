package 
{
	import utils.views.DView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Editor extends DView 
	{
		private var map_width:int = 800;
		private var map_height:int = 700;
		private var tile_width:int = 50;
		private var tiles:Vector.<Tile>;
		private var generateBtn:BtnGenerate;
		private var horizontal:int;
		private var vertical:int;
		public function Editor() 
		{
			super();
		}
		
		override public function init():void {
			super.init();
			tiles = new Vector.<Tile>();
			horizontal = map_width / tile_width;
			vertical = map_height / tile_width;
			for (var i:int = 0; i < horizontal; i++) 
			{
				for (var j:int = 0; j < vertical; j++) 
				{
					var tile:Tile = new Tile(i, j);
					addChild(tile);
					tiles.push(tile);
				}
			}
			generateBtn = new BtnGenerate();
			generateBtn.onGenerate = generateMap;
			addChild(generateBtn);
		}
		
		private function generateMap():void {
			var map:Array = new Array();
			for (var i:int = 0; i < horizontal; i++) 
			{
				var t:Array = new Array();
				for (var j:int = 0; j < vertical; j++) 
				{
					for (var k:int = 0; k < tiles.length; k++) 
					{
						if (tiles[k].getType(i,j)>-1) {
							t.push(tiles[k].getType(i, j));
						}
					}
				}
				map[i] = t;
			}
			var obj:Object = new Object();
			obj.map = map;
			trace(JSON.stringify(obj));
		}
		
	}

}