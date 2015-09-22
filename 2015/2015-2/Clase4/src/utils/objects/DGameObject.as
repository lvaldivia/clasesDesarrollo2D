package utils.objects 
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import utils.loader.DLoader;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class DGameObject extends Sprite
	{
		protected var _positionBmd:Point;
		protected var life:int;
		protected var isAlive:Boolean = true;
		protected var currentClip:String;
		protected var skin:MovieClip;
		protected var _bmd:BitmapData;
		
		public function DGameObject(clip:String,_life:int=100) 
		{
			currentClip = clip;
			life = _life;
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}
		public function init():void
		{
		var clas:Class = DLoader.getAsset(currentClip) as Class;
		skin  = new clas();
		addChild(skin);
		bmd = new BitmapData(skin.width, skin.height);
		positionBmd = new Point(x, y);
		bmd.draw(skin);
		}
		
		public function hit(target:DGameObject):Boolean 
		{
		  return hitTestObject(target);	
		}
		
		public function hitBmd(target:DGameObject):Boolean
		{
			return bmd.hitTest(positionBmd, 255, target._bmd, target.positionBmd);
		}
		public function hitPos(target:DGameObject):Boolean 
		{
			var dx:Number = x -target.x;
			var dy:Number = y - target.y;
			var distance:Number = (dx * dx) + (dy * dy);
			var sqtr:Number = Math.sqrt(distance);
			var r1:Number = width / 2;
			var r2:Number = target.width / 2;
			if (sqtr < r1 + r2)
			{
				return true;
				
			}
			
			return false
		}
		public function update():void
		{
			if (positionBmd != null)
			{
				positionBmd.x = x;
				positionBmd.y = y;
			}
		}
		private function removed(e:Event):void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		public function destroy():void 
		{
			removeChildren();
		}
		
		public function get bmd():BitmapData 
		{
			return _bmd;
		}
		
		public function set bmd(value:BitmapData):void 
		{
			_bmd = value;
		}
		
		public function get positionBmd():Point 
		{
			return _positionBmd;
		}
		
		public function set positionBmd(value:Point):void 
		{
			_positionBmd = value;
		}
	}

}