package utils.objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.loader.DLoader;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DGameObject extends Sprite
	{
		protected var life:int;
		protected var isAlive:Boolean = true;
		protected var currentClip:String;
		protected var skin:MovieClip;
		
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
			var c:Class = DLoader.getAsset(currentClip) as Class;
			skin = new c();
			addChild(skin);
		}
		
		public function update():void {
			
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
		
	}

}