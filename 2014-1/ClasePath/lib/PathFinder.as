/**
 * Original Author: wojciech[at]sierakowski.eu
 * Author website: http://sierakowski.eu/
 * Modified by: <David Jalbert> jalbert.d@hotmail.com
 * Website: http://www.melloland.com
 *
 * http://en.wikipedia.org/wiki/Pathfinding
 */

package lib
{
	import flash.geom.Point;
 
  public class PathFinder
  {
    public static var _map:Array, _queue:Array;
 		public static var startCell:Object, endCell:Object;
		
		public static function isStart(x:int, y:int)
		{
			if (x == startCell.x && y == startCell.y) return true;
			return false;
		}
		
		public static function isEnd(x:int, y:int)
		{
			if (x == endCell.x && y == endCell.y) return true;
			return false;
		}
		
		// Gets the next optimal cell from the path found
		public static function findNextCell(cell:Object)
		{
			var i:int = 0;
			var newCell:Object = cell;
			var availableCells:Array = new Array();
			for (i = 0; i < _queue.length; i++)
			{
				if (_queue[i].counter < newCell.counter && Math.abs(_queue[i].x - newCell.x) <= 1 && Math.abs(_queue[i].y - newCell.y) <= 1 && (Math.abs(_queue[i].x - newCell.x) == 0 || Math.abs(_queue[i].y - newCell.y) == 0))
				{
					availableCells.push(_queue[i]);
				}
			}
			if (availableCells.length > 0)
			{
				newCell = availableCells[0];
				var shortestPath:Number = newCell.counter;
				for (i = 1; i < availableCells.length; i++)
				{
					if (newCell.counter < shortestPath)
					{
						shortestPath = newCell.counter;
						newCell = availableCells[i];
					}
				}
			}
			return newCell;
		}
		
		public static function getBestPath(startX:int, startY:int, endX:int, endY:int, map:Array):Array
		{
			startCell = {x:startX, y:startY, counter:1000};
			endCell = {x:endX, y:endY, counter:0};
			findPath(map);
			var bestPath:Array = new Array();
			var newCell:Object = startCell;
			bestPath.push(newCell);
			while(newCell.counter > 0)
			{
				newCell = findNextCell(newCell);
				bestPath.push(newCell);
			}
			return bestPath;
		}
		
    public static function findPath(map:Array):Array
    {
      var i:int, j:int;
      _queue = new Array();
      _map = map;
 
      //first find the coordinate of finish which is a first object
      var finishObject:Object;
      var counter:int = 0;
      for (i = 0; i < _map.length; i++)
      {
        for (j = 0; j < _map[i].length; j++)
        {
          if (isEnd(i,j))
          {
            finishObject = {x:i, y:j, counter:0};
            break;
          }
        }
      }
      _queue.push(finishObject);
 
      //run recursive function to find the shortest path
      checkQueue(0, 1);
 
      return _queue;
    }
 
    private static function checkQueue(startIndex:int, counter:int):void
    {
      var lastQueueLength:int = _queue.length;
      var i:int;
 
      //check neigbours of the _queue element
      for (i = startIndex; i < lastQueueLength; i++)
      {
        var coordinate:Object;
        //check top
        if (_queue[i].y != 0 && _map[_queue[i].x][_queue[i].y - 1] == 0)
        {
          coordinate = {x: _queue[i].x, y: _queue[i].y - 1, counter:counter};
          //if this coordinate is the start finish algorothm as 
          //the shortest path was just found
          if (isStart(coordinate.x, coordinate.y)) return;
          //if a coordinate already exists in the queue 
          //and has higher coordinate it won't be added
          //but if it has lower coordinate it will replace the one in the queue
          if (canBeAddedToQueue(coordinate)) _queue.push(coordinate);
        }
        //check right
        if (_queue[i].x != _map.length - 1 && 
                        _map[_queue[i].x + 1][_queue[i].y] == 0)
        {
          coordinate = {x: _queue[i].x + 1, y: _queue[i].y, counter:counter};
          if (isStart(coordinate.x, coordinate.y)) return;
          if (canBeAddedToQueue(coordinate)) _queue.push(coordinate);
        }
        //check bottom
        if (_queue[i].y != _map[_queue[i].x].length - 1 && 
                           _map[_queue[i].x][_queue[i].y + 1] == 0)
        {
          coordinate = {x: _queue[i].x, y: _queue[i].y + 1, counter:counter};
          if (isStart(coordinate.x, coordinate.y)) return;
          if (canBeAddedToQueue(coordinate)) _queue.push(coordinate);
        }
        //check left
        if (_queue[i].x != 0 && _map[_queue[i].x - 1][_queue[i].y] == 0)
        {
          coordinate = {x: _queue[i].x - 1, y: _queue[i].y, counter:counter};
          if (isStart(coordinate.x, coordinate.y)) return;
          if (canBeAddedToQueue(coordinate)) _queue.push(coordinate);
        }
      }
 
      checkQueue(lastQueueLength, counter + 1);
    }
 
    public static function canBeAddedToQueue(coordinate:Object):Boolean
    {
      for (var i:int = _queue.length - 1; i >= 0 ; i--)
      {
        if (coordinate.x == _queue[i].x && coordinate.y == _queue[i].y)
        {
          if (coordinate.counter >= _queue[i].counter)
          {
            return false;
          }
          else
          {
            _queue.splice(i, 1);
            return true;
          }
        }
      }
      return true;
    }
  }  
}