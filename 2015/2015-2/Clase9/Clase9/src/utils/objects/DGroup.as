package utils.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author L
	 */
	public class DGroup extends Sprite
	{
		
		public function DGroup() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		public function getFirstAlive():DGameObject{
			for (var i:int = 0; i < numChildren; i++) 
			{
				var mc:DGameObject = getChildAt(i) as DGameObject;
				if (mc.isAlive)
					return mc;
			}
			return null;
		}
		
		public function createMultiple(elements:int, obj:Class,clip:String):void {
			for (var i:int = 0; i < elements; i++) 
			{
				var mc:DGameObject = new obj(clip);
				mc.isAlive = false;
				mc.visible = false;
				addChild(mc);
			}
		}
		
		public function rebordAll():void{
			for (var i:int = 0; i < numChildren; i++) 
			{
				var mc:DGameObject = getChildAt(i) as DGameObject;
				mc.reborn();
			}
		}
		
		public function killAll():void{
			for (var i:int = 0; i < numChildren; i++) 
			{
				var mc:DGameObject = getChildAt(i) as DGameObject;
				mc.kill();
			}
		}
		
		public function getFirstDead():DGameObject{
			for (var i:int = 0; i < numChildren; i++) 
			{
				var mc:DGameObject = getChildAt(i) as DGameObject;
				if (!mc.isAlive)
					return mc;
			}
			return null;
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			removeChildren();
		}
		
	}

}