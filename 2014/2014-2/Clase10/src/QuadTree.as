package  
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author ISIL
	 */
	public class QuadTree 
	{
		private var objects:Array;
		private var nodes:Array;
		private var bounds:Rectangle;
		private var level:int;
		private var _stage:DisplayObject;
		private var MAX_OBJECTS:int = 10;
        private var MAX_LEVELS:int = 5;
		
		public function QuadTree(l:int,b:Rectangle,stage:DisplayObject) 
		{
			level = l;
			bounds = b;
			nodes = new Array(4);
			objects = new Array();
			_stage = stage;
		}
		
		public function clear():void {
			while (nodes.length>0) 
			{
				nodes.splice(0, 1);
			}
			while (objects.length>0) 
			{
				objects.splice(0, 1);
			}
		}
		
		public function split():void {
			var subWidth:int =int(bounds.width / 2);
			var subHeight:int = int(bounds.height / 2);
			var x:int = int(bounds.x);
			var y:int = int(bounds.y);
			
			nodes[0] = new QuadTree(level + 1, new Rectangle(x + subWidth, y, subWidth, subHeight),_stage);
			nodes[1] = new QuadTree(level + 1, new Rectangle(x, y, subWidth, subHeight),_stage);
			nodes[2] = new QuadTree(level + 1, new Rectangle(x, y+subHeight, subWidth, subHeight),_stage);
			nodes[3] = new QuadTree(level + 1, new Rectangle(x+subWidth, y+subHeight, subWidth, subHeight),_stage);
		}
		
		public function getIndex(pRect:Rectangle):int {
			var index:int = -1;
            var horizontalMidpoint:Number = bounds.x + (bounds.width / 2);
            var verticalMidpoint:Number = bounds.y + (bounds.height / 2);
			var topCuadrant:Boolean =  false;
			if (pRect.y < verticalMidpoint) {
				topCuadrant = true;
			}
			var bottomCuadrant:Boolean = false;
			if (pRect.y  > verticalMidpoint) {
				bottomCuadrant = true;
			}
			if (pRect.x < horizontalMidpoint) {
				if (topCuadrant) {
					index = 1;
				}
				if (bottomCuadrant) {
					index = 2;
				}
			}
			if (pRect.x > horizontalMidpoint) {
				if (topCuadrant) {
					index = 0;
				}
				if (bottomCuadrant) {
					index = 3;
				}
			}
			return index;
		}
		
		public function insert(pRect:Sprite):void 
        {
            if (nodes[0] != null) 
            {
                var index:int = getIndex(pRect.getRect(_stage));
                
                if (index != -1 && nodes[index] != null) 
                {
                    nodes[index].insert(pRect);
                    return;
                }
            }
            
            objects.push(pRect);
        
            if (objects.length > MAX_OBJECTS && level < MAX_LEVELS) 
            {
                if (nodes[0] == null) 
                {
                    split();
                }
                
                var i:int = 0;
                while (i < objects.length) 
                {
                    var index1:int = getIndex(objects[i].getRect(_stage));
                    if (index1 != -1 && nodes[index1] != null) 
                    {
                        nodes[index1].insert(objects[i]);
                        objects.splice(i, 1);
                    }
                    else 
                    {
                        i += 1;
                    }
                }
            }
        }
		
		public function retrieve(returnObjects:Array, pRect:Sprite):Array
        {
            var index:int = getIndex(pRect.getRect(_stage));
           
            if (nodes[0] != null && index != -1 && nodes[index] != null) 
            {
                nodes[index].retrieve(returnObjects, pRect);
            }
        
            for (var i:int = 0; i < objects.length; i += 1)
            {
                if (objects[i] != null) 
                {
                    returnObjects.push(objects[i]);
                }
            }
            
        
            return returnObjects;
         }
		
		
		
		
	}

}