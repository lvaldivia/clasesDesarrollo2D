package game.manager 
{
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import game.objects.Enemy;
	import utils.Collision.QuadTree;
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author 
	 */
	public class ObjectManager 
	{
		private var canvas:Sprite;
		private var enemys:Vector.<Enemy>;
		private var quadtree:QuadTree;
		private var hitTarget:DGameObject;
		
		public function ObjectManager(_canvas:Sprite) 
		{
			canvas = _canvas;
			enemys = new Vector.<Enemy>();
			quadtree = new QuadTree(0, new Rectangle(0, 0,
									canvas.stage.stageWidth, canvas.stage.stageHeight)
									,canvas.stage);
		}
		
		public function setHitTarget(_hitTarget:DGameObject):void {
			hitTarget = _hitTarget;
		}
		
		public function addEnemy():void {
			var enemy:Enemy = new Enemy();
			canvas.addChild(enemy);
			enemys.push(enemy);
		}
		
		public function update():void {
			quadtree.clear();
			for (var i:int = 0; i < enemys.length; i++) 
			{
				if (enemys[i].outOfBounds) {
					canvas.removeChild(enemys[i]);
					enemys.splice(i, 1);
				}else {
					enemys[i].update();
					quadtree.insert(enemys[i]);
				}
			}
			
			var returnObjects:Array = new Array();
			quadtree.retrieve(returnObjects, hitTarget);
			for (var j:int = 0; j < returnObjects.length; j++) 
			{
				if (returnObjects[j].hitByPos(hitTarget)) {
					returnObjects[j].outOfBounds = true;
					returnObjects.splice(j, 1);
				}
			}
		}
		
	}

}