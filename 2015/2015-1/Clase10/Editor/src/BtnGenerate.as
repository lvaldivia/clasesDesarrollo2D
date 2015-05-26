package 
{
	import flash.events.MouseEvent;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class BtnGenerate extends DGameObject 
	{
		public var onGenerate:Function;
		public function BtnGenerate() 
		{
			super();
			currentClip = "generate";
		}
		
		override public function init():void {
			super.init();
			buttonMode = true;
			x = 850;
			y = 150;
			mouseChildren = false;
			addEventListener(MouseEvent.CLICK, generateMap);
		}
		
		private function generateMap(e:MouseEvent):void 
		{
			if (onGenerate != null) {
				onGenerate();
			}
		}
		
	}

}