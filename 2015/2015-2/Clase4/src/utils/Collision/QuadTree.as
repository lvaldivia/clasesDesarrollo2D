package utils.Collision 
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.geom.Rectangle;

    public class QuadTree 
    {
        private var _stage:DisplayObject;
        private var MAX_OBJECTS:int = 10;
        private var MAX_LEVELS:int = 5;
        
        private var level:int;
        private var objects:Array; 
        private var bounds:Rectangle;
        private var nodes:Array; 
        
        public function QuadTree(pLevel:int, pBounds:Rectangle, stage:DisplayObject) 
        {
            _stage = stage;
            level = pLevel;
            objects = new Array();
            bounds = pBounds;
            nodes = new Array(4);
        }
  
        public function clear():void
        {
            for (var i:int = 0; i < objects.length; i += 1)
            {
                if (objects[i] != null) 
                {
                    objects.splice(i, 1);
                }
            }
            
            for (var j:int = 0; j < nodes.length; j += 1)
            {
                if (nodes[j] != null) 
                {
                    nodes.splice(j, 1);
                }
            }
        }

        private function split():void 
        {
            var subWidth:int = int(bounds.width / 2);
            var subHeight:int = int(bounds.height / 2);
            var x:int = int(bounds.x);
            var y:int = int(bounds.y);
            
            nodes[0] = new QuadTree(level + 1, new Rectangle(x + subWidth, y, subWidth, subHeight), _stage);
            nodes[1] = new QuadTree(level + 1, new Rectangle(x, y, subWidth, subHeight), _stage);
            nodes[2] = new QuadTree(level + 1, new Rectangle(x, y + subHeight, subWidth, subHeight), _stage);
            nodes[3] = new QuadTree(level + 1, new Rectangle(x + subWidth, y + subHeight, subWidth, subHeight), _stage);
        }
        

        private function getIndex(pRect:Rectangle):int
        {
            var index:int = -1;
            var verticalMidpoint:Number = bounds.x + (bounds.width / 2);
            var horizontalMidpoint:Number = bounds.y + (bounds.height / 2);
            
           
            var topQuadrant:Boolean = (pRect.y < horizontalMidpoint && pRect.y + pRect.height < horizontalMidpoint);
            var bottomQuadrant:Boolean = (pRect.y > horizontalMidpoint);
 
            if (pRect.x < verticalMidpoint && pRect.x + pRect.width < verticalMidpoint) 
            {
                if (topQuadrant) 
                {
                    index = 1;
                }
                else if (bottomQuadrant) 
                {
                    index = 2;
                }
            }
            else if (pRect.x > verticalMidpoint) 
            {
                if (topQuadrant) 
                {
                    index = 0;
                }
                else if (bottomQuadrant) 
                {
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