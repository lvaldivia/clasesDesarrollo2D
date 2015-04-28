package utils 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class DView extends Sprite 
	{
		protected var skin:MovieClip;
		protected var currentClip:String = "";
		public function DView() 
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
		
		public function init():void 
		{
			var c:Class = DLoader.getAsset(currentClip);
			skin = new c();
			addChild(skin);
		}
		
		public function initAnim():void {
			
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
		
	}

}