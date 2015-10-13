package utils.objects 
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.globalization.LocaleID;
	import utils.loader.DLoader;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DGameObject extends Sprite
	{
		
		protected var life:int;
		protected var _isAlive:Boolean = true;
		protected var currentClip:String;
		protected var skin:MovieClip;
		protected var _bmd:BitmapData;
		protected var isHurt:Boolean = false;
		protected var _outOfBounds:Boolean = false;
		protected var _positionBmd:Point;
		
		public function DGameObject(clip:String,_life:int = 100) 
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
			try 
			{
				var c:Class = DLoader.getAsset(currentClip) as Class;
				skin = new c();
				addChild(skin);
				bmd = new BitmapData(skin.width, skin.height);
				positionBmd = new Point(x, y);
				bmd.draw(skin);
			}catch(e:Error){
				trace("Current clip is not currently available");
			}
		}
		
		public function kill():void{
			isAlive = false;
			visible = false;
			scaleX = scaleY = 1;
		}
		
		public function reset(_x:Number,_y:Number):void{
			x = _x;
			y = _y;
			reborn();
		}
		
		public function reborn():void{
			outOfBounds = false;
			visible = true;
			isAlive = true;
			if (positionBmd != null) {
				positionBmd.x = x;
				positionBmd.y = y;
			}
			isHurt = false;
		}
		
		public function hit(target:DGameObject):Boolean
		{
			return hitTestObject(target);
		}
		
		public function hitBmd(target:DGameObject):Boolean {
			return bmd.hitTest(positionBmd, 255, target.bmd,
				target.positionBmd);
		}
		
		public function hitPos(target:DGameObject):Boolean {
			var dx:Number = x -target.x;
			var dy:Number = y -target.y;
			var distance:Number = (dx * dx) + (dy * dy);
			var sqtr:Number = Math.sqrt(distance);
			var r1:Number = width / 2;
			var r2:Number = target.width / 2;
			if (sqtr < r1 + r2 ) {
				return true;
			}
			return false;
		}
		
		public function update():void {
			if (positionBmd != null) {
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
		
		public function get isAlive():Boolean 
		{
			return _isAlive;
		}
		
		public function set isAlive(value:Boolean):void 
		{
			_isAlive = value;
		}
		
		public function get outOfBounds():Boolean
		{
			return _outOfBounds;
		}
		
		public function set outOfBounds(value:Boolean):void 
		{
			_outOfBounds = value;
		}
		
	}

}