package src.views 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Alonso
	 */
	public class InstruccionesView extends Sprite 
	{
		private var bg:MovieClip;
		public function InstruccionesView() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage)
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			bg = new instrucciones_view();
			bg.jugar.addEventListener(MouseEvent.MOUSE_OVER, overJugar);
			bg.jugar.addEventListener(MouseEvent.MOUSE_OUT, outJugar);
			addChild(bg);
		}
				
		private function overJugar(e:MouseEvent):void 
		{
			
		}
		
		private function outJugar(e:MouseEvent):void 
		{
			
		}

		
	}

}