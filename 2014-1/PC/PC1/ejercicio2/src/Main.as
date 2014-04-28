package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author jorge
	 */
	public class Main extends Sprite 
	{
		var _carrito:carrito;
		var velX:Number = 4;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			_carrito = new carrito();
			addChild(_carrito);
			stage.addEventListener(Event.ENTER_FRAME, mover);
			_carrito.scaleX *= -1;
			_carrito.x = stage.stageWidth / 2;
			_carrito.y = stage.stageHeight / 2;
		}
		
		private function mover(e:Event):void 
		{
			_carrito.x += velX;
			if (_carrito.x >= stage.stageWidth - _carrito.width / 2 || _carrito.x <= 0 + _carrito.width / 2)
			{
				velX *= -1;
				_carrito.scaleX *= -1;
			}
		}
		
	}
	
}