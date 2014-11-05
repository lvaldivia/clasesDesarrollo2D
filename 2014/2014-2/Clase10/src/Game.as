package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class Game extends Sprite
	{
		private var hero:Hero;
		private var current:Number;
		private var elapsed:Number;
		private var enemies:Vector.<Enemy>;
		private var quadtree:QuadTree;
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			hero = new Hero();
			addChild(hero);
			elapsed = 0;
			current = getTimer();
			enemies = new Vector.<Enemy>();
			stage.addEventListener(Event.ENTER_FRAME, loop);
			quadtree = new QuadTree(0, 
				new Rectangle(0, 0, stage.stageWidth, 
						stage.stageHeight)
					, stage);
		}
		
		private function loop(e:Event):void 
		{
			hero.x = mouseX;
			hero.y = mouseY;
			var dt:Number = (getTimer() - current) * 0.001;
			current = getTimer();
			elapsed += 1;
			quadtree.clear();
			if (elapsed >= 40) {
				for (var i:int = 0; i < 9; i++) 
				{
					var ene:Enemy = new Enemy();
					addChild(ene);
					ene.x = stage.stageWidth - ene.width;
					ene.y = i * (ene.height + 20);
					enemies.push(ene);
				}
				elapsed = 0;
			}else {
				elapsed++;
			}
			
			
			var total_enemies:int = enemies.length;
			if (total_enemies > 0) {
				for (var j:int = 0; j < total_enemies; j++) 
				{
					quadtree.insert(ene);
					enemies[j].move();
					/*if (enemies[j].x <= -enemies[j].width) {
						removeChild(enemies[j]);
						enemies.splice(j, 1);
						total_enemies--;
					}*/
				}
			}
			var returnObjs:Array = new Array();
			returnObjs=quadtree.retrieve(returnObjs, hero);
			trace(returnObjs);
			for (var k:int = 0; k < returnObjs.length; k++) 
			{
				if (hero.hitTestObject(returnObjs[k])) {
					trace("choque");
				}
			}
			
			for (var m:int = 0; m < returnObjs.length; m += 1)
            {
                if (returnObjs[m] != null) 
                {
                    returnObjs.splice(m, 1);
                }
            }
		}
		
	}

}