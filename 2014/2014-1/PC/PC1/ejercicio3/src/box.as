package src
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author jorge
	 */
	public class box extends Sprite
	{
		private var _box:Sprite;
		public function box() 
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
			_box = new boxi();
			this.addChild(_box);
		}
		
	}

}