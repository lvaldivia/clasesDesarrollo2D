package 
{
	import flash.events.MouseEvent;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class BtnAddCoin extends DGameObject 
	{
		public var onAddCoin:Function;
		public function BtnAddCoin() 
		{
			super();
			currentClip = "add_coins";
		}
		
		override public function init():void {
			super.init();
			mouseChildren = false;
			x = 850;
			y = 300;
			addEventListener(MouseEvent.CLICK, add);
			buttonMode = true;
		}
		
		private function add(e:MouseEvent):void 
		{
			onAddCoin();
		}
		
	}

}