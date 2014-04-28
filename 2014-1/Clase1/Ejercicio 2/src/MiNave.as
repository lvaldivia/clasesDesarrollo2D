package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Richard Da Cruz
	 */
	public class MiNave extends Sprite
	{
		private var contenido:Sprite;
		public function MiNave() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, agregarScena);
			this.addEventListener(Event.REMOVED, removerScena)
		}
		
		private function removerScena(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removerScena);
		}

		
		private function agregarScena(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, agregarScena);
			contenido = new nave();
			this.addChild(contenido);
		}
		

		
	}

}