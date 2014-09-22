package objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Enemy extends Sprite
	{
		private var content:Sprite;
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
			content.addEventListener(MouseEvent.CLICK, click);
		}
		
		private function click(e:MouseEvent):void 
		{
			
		}
		
	}

}