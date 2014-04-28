package src  
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Richard Da Cruz
	 */
	public class MiEnemigo extends Sprite 
	{
		private var contenido:Sprite;
		private var posX = Number;
		public function MiEnemigo(pX:Number) 
		{
			super();
			posX = pX;
			this.addEventListener(Event.ADDED_TO_STAGE, agregarScena);
		}
		
		private function agregarScena(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, agregarScena);
			contenido = new enemigo();
			contenido.x = posX;
			this.addChild(contenido);
		}
		public function morir():void 
		{
			if (contenido.alpha==1) 
			{
				contenido.alpha = 0.5;
			}
			
		}
		
	}

}