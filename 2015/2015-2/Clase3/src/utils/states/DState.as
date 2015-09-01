package utils.states 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DTempo;
	import utils.loader.DLoader;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DState extends Sprite
	{
		public var skin:MovieClip;
		private var _clip:String;
		private var useLoop:Boolean;
		public function DState(clip:String='',use_loop:Boolean=false)
		{
			_clip = clip;
			addEventListener(Event.ADDED_TO_STAGE, added);
			useLoop = use_loop;
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			if (useLoop) {
				DTempo.init();
				stage.addEventListener(Event.ENTER_FRAME, loop);
			}
			init();
		}
		
		private function loop(e:Event):void 
		{
			update();
		}
		
		public function update():void {
			DTempo.update();
		}
		
		public function init():void {
			if (_clip != '') {
				var c:Class = DLoader.getAsset(_clip) as Class;
				skin = new c();
				addChild(skin);
			}else {
				var content:Sprite = new Sprite();
				content.graphics.beginFill(Math.random() * 0xFFF000);
				content.graphics.drawRect(0, 0, 
						stage.stageWidth, stage.stageHeight);
				content.graphics.endFill();
				addChild(content);
			}
			
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			if (stage.hasEventListener(Event.ENTER_FRAME)) {
				stage.removeEventListener(Event.ENTER_FRAME, loop);
			}
			destroy();
		}
		
		public function destroy():void {
			removeChildren();
		}
		
	}

}