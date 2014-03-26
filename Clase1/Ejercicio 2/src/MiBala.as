package  src
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Richard Da Cruz
	 */
	public class MiBala extends Sprite 
	{
		private var contenido:Sprite;
		private var posX:Number;
		private var posY:Number;
		public function MiBala(pX:Number,pY:Number) 
		{
			super();
			posX = pX;
			posY = pY;
			this.addEventListener(Event.ADDED_TO_STAGE, agregarScena);
			
		}
		
		private function agregarScena(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, agregarScena);
			contenido = new bala();
			contenido.x = posX;
			contenido.y = posY;
			this.addChild(contenido);
		}
		public function mover():void
		{
			if (contenido != null)
			{
				if (contenido.y >0)
				{
						contenido.y -= 6;
				}
				else
				{
					removeChild(contenido);
					contenido = null;
				}
			}
		}
		
	}

}