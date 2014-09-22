package objects 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Enemy extends Sprite
	{
		private var content:Sprite;
		private var elapsed:Number;
		private var bmdData:BitmapData;
		private var p:Point;
		
		public function Enemy() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			var a:Class = Global.assets.getDefinition('almohada') as Class;
			content = new a();
			addChild(content);
			content.scaleX = 0.5;
			content.scaleY = 0.5;
			elapsed = 0;
			content.x = 250;
			content.y = 150;
			bmdData = new BitmapData(10, 10);
			content.addEventListener(MouseEvent.CLICK, click);
			bmdData.draw(content);
			p = new Point(content.x, content.y);
		}
		
		public function update(dt:Number):void {
			elapsed += dt;
			if (elapsed >= 0.5) {
				content.x -= 10;
				elapsed = 0;
				p.x = content.x;
				p.y = content.y;
			}
		}
		
		public function checkBorder(bmdHit:BitmapData, p1:Point):Boolean {
			if (bmdHit != null) {
				trace(p1.x, p.x);
				if (bmdData.hitTest(p1, 255, bmdHit,p)) {
					trace("hit");
				}
			}
			
			if (content.x < 0) {
				removeChild(content)
				return true;
			}
			return false;
		}
		
		private function click(e:MouseEvent):void 
		{
			
		}
		
	}

}