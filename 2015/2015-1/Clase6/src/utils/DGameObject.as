package utils 
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author 
	 */
	public class DGameObject extends Sprite 
	{
		protected var currentClip:String = "";
		protected var _outOfBounds:Boolean;
		protected var _bmd:BitmapData;
		protected var _bmdPoints:Point;
		
		public function DGameObject() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			init();
		}
		
		public function init():void {
			var c:Class = DLoader.getAsset(currentClip);
			var mc:MovieClip = new c();
			addChild(mc);
			bmd = new BitmapData(mc.width, mc.height, true);
			bmd.draw(mc);
			bmdPoints = new Point(x, y);
		}
		
		public function update():void {
			bmdPoints.x = x;
			bmdPoints.y = y;
		}
		
		public function hitBitmap(target:BitmapData, targetPoints:Point):Boolean {
			return bmd.hitTest(targetPoints, 255, target,bmdPoints);
		}
		
		public function hit(target:DGameObject):Boolean {
			return hitTestObject(target);
		}
		
		public function onAnimationComplete():void {
			
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		public function destroy():void 
		{
			while (numChildren > 0) {
				removeChildAt(0);
			}
		}
		
		public function get outOfBounds():Boolean 
		{
			return _outOfBounds;
		}
		
		public function set outOfBounds(value:Boolean):void 
		{
			_outOfBounds = value;
		}
		
		public function get bmd():BitmapData 
		{
			return _bmd;
		}
		
		public function set bmd(value:BitmapData):void 
		{
			_bmd = value;
		}
		
		public function get bmdPoints():Point 
		{
			return _bmdPoints;
		}
		
		public function set bmdPoints(value:Point):void 
		{
			_bmdPoints = value;
		}
		
	}

}