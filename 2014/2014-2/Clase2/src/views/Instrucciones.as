package views 
{
	import events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Instrucciones extends Sprite
	{
		
		public function Instrucciones() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			var circle:Sprite = new Sprite();
			circle.graphics.beginFill(0x00FFF0);
			circle.graphics.drawCircle(0, 0, 50);
			circle.graphics.endFill();
			circle.x = (stage.stageWidth / 2) - circle.width;
			addChild(circle);
			circle.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			removeChildAt(0);
		}
		
		private function click(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW,'game', true));
		}
		
	}

}