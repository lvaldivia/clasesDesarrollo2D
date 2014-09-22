package objects 
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Luis
	 */
	public class Hero extends Sprite
	{
		private var content:Sprite;
		private var _bmdData:BitmapData;
		private var _p:Point;
		
		public function Hero() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added );
			
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			var a:Class = Global.assets.getDefinition('almohada') as Class;
			content = new a();
			addChild(content);
			content.y = 150;
			content.scaleX = 0.5;
			content.scaleY = 0.5;
			bmdData = new BitmapData(10, 10);
			bmdData.draw(content);
			p = new Point(content.width/2, content.y);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			
		}
		
		public function get bmdData():BitmapData 
		{
			return _bmdData;
		}
		
		public function set bmdData(value:BitmapData):void 
		{
			_bmdData = value;
		}
		
		public function get p():Point 
		{
			return _p;
		}
		
		public function set p(value:Point):void 
		{
			_p = value;
		}
		
	}

}