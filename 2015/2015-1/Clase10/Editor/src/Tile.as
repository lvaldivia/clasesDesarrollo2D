package 
{
	import flash.events.MouseEvent;
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author 
	 */
	public class Tile extends DGameObject
	{
		private var posX:int;
		private var posY:int;
		public function Tile(_pX:int,_pY:int ) 
		{
			super();
			currentClip = 'empty';
			posX = _pX;
			posY = _pY;
			currentState = currentClip;
		}
		
		override public function init():void {
			super.init();
			x = posX * width;
			y = posY * height;
			addState("empty", "empty");
			addState("wall", "columna");
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, change);
		}
		
		public function getType(pX:int ,pY:int):int {
			if (posX == pX && posY == pY) {
				if (currentState == 'wall') {
					return 1;
				}
				if (currentState == 'empty') {
					return 0
				}
			}
			return -1;
		}
		
		private function change(e:MouseEvent):void 
		{
			if (currentState == 'wall') {
				setState('empty');
			}else {
				setState("wall");
			}
		}
		
	}

}