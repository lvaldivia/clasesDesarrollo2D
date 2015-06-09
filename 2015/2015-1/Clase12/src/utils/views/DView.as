package utils.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.loaders.DLoader;
	
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
			if (currentClip != '') {
				var c:Class = DLoader.getAsset(currentClip);
				skin = new c();
				addChild(skin);
			}else {
				var bg:Sprite = new Sprite();
				bg.graphics.beginFill(0x00FF00);
				bg.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
				bg.graphics.endFill();
				addChild(bg);
			}
			
			
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