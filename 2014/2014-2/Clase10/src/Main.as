package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class Main extends Sprite 
	{
		private var enemyArray:Vector.<Enemy>;
        private var enemy:Enemy;
        private var hero:Hero;
        private var unitCounter:uint = 0;
        private var unitRate:uint = 40;
        private var quadTree:QuadTree;
		private var current:int;
		private var elapsed:Number=0;
       
        public function Main():void 
        {
            if (stage) init();
            else addEventListener(Event.ADDED_TO_STAGE, init);
        }
       
        private function init(e:Event = null):void 
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
           
            quadTree = new QuadTree(0, new Rectangle(0, 0, 700, 550), this.stage);
            enemyArray = new Array();
			current = getTimer();
            hero = new Hero();
            hero.x = 100;
            hero.y = 200;
            stage.addChild(hero);
       
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
        }
       
        private function onEnterFrame(e:Event = null):void
        {
            hero.x = stage.mouseX;
            hero.y = stage.mouseY;
           
            var dt:Number = (getTimer() - current) * 0.001;
			current = getTimer();
			elapsed += dt;
			quadTree.clear();
			if (elapsed >= 1) {
				for (var i:int = 0; i < 9; i++) 
				{
					var ene:Enemy = new Enemy();
					addChild(ene);
					ene.x = stage.stageWidth - ene.width;
					ene.y = i * (ene.height + 20);
					enemyArray.push(ene);
				}
				elapsed = 0;
			}
			quadTree.clear();

			if (enemyArray.length > 0) {
				for (var l:int = 0; l < enemyArray.length; l++) 
				{
					quadTree.insert(enemyArray[l]);
					enemyArray[l].move();
					 if (enemyArray[l] != null && enemyArray[l].x < -10)
					{
						removeChild(enemyArray[l]);
						enemyArray.splice(l, 1);
					}
				}
			}
           
           
            var returnObjects:Array = new Array();

            quadTree.retrieve(returnObjects, hero);
			trace(returnObjects)
            for (var k:int = 0; k < returnObjects.length; k += 1) 
            {
                if (returnObjects[k].hitTestObject(hero))
                {
                    if (returnObjects[k].parent != null)
                    {
                        returnObjects[k].destroy();
                        returnObjects.splice(k, 1);
                    }       
                }
            }         
        }
    }
   
}
