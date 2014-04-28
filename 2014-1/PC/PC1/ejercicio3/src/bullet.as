package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author jorge
	 */
	public class bullet extends Sprite 
	{
		private var _bullet:Sprite;
		private var posX:Number;
		private var posY:Number;
		
		public function bullet(pX:Number,pY:Number) 
		{
			super();
			posX = pX;
			posY = pY;
			this.addEventListener(Event.ADDED_TO_STAGE, agregarScena);
		}
		
		private function agregarScena(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, agregarScena);
			_bullet = new boxi();
			_bullet.x = posX;
			_bullet.y = posY;
			_bullet.scaleX = 0.5;
			_bullet.scaleY = 0.5;
			this.addChild(_bullet);
			_bullet.addEventListener(Event.ENTER_FRAME, mover);
		}
		
		public function mover(e:Event):void
		{
			if (_bullet != null)
			{
				if (_bullet.y >0)
				{
					_bullet.y -= 6;
					_bullet.rotation += 5;
					if(_bullet.y<=stage.stageHeight/2){
					_bullet.alpha = 0.5;
					}
				}
				else
				{
					removeChild(_bullet);
					_bullet = null;
				}
			}
		}
		
	}

}