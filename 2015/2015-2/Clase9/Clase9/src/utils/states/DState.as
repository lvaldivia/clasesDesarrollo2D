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
		protected var skin:MovieClip;
		protected var _clip:String;
		private var useLoop:Boolean;
		protected var deltaTime:Number;
		public function DState(clip:String='',use_loop:Boolean=false)
		{
			_clip = clip;
			addEventListener(Event.ADDED_TO_STAGE, added);
			deltaTime = 0;
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
			deltaTime = DTempo.dt;
		}
		
		public function getClass(clip:String):Class{
			var c:Class = DLoader.getAsset(clip) as Class;
			return c;
		}
		
		public function init():void {
			if (_clip != '') {
				var c:Class = DLoader.getAsset(_clip) as Class;
				skin = new c();
				addChild(skin);
			}else {
				var content:Sprite = new Sprite();
				content.graphics.beginFill(0x000000);
				content.graphics.drawRect(0, 0, 
						stage.fullScreenWidth, stage.fullScreenHeight);
				content.graphics.endFill();
				addChild(content);
			}
		}
		
		public function activateTweens():void{}
		
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