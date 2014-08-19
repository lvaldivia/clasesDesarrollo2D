package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Heroe extends Sprite
	{
		private var _contenido:Sprite;
		
		public function Heroe() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			contenido = new heroe();
			addChild(contenido);
		}
		
		public function mover():void {
			x += 2;
		}
		
		public function get contenido():Sprite 
		{
			return _contenido;
		}
		
		public function set contenido(value:Sprite):void 
		{
			_contenido = value;
		}
		
		
	}

}