package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Canon extends Sprite 
	{
		private var distancia:int = 10;
		public function Canon() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			graphics.beginFill(0x00FF00);
			graphics.drawCircle(0, 0, 25);
			graphics.endFill();
		}
		
		public function disparar(dt:Number):void {
			
		}
		
	}

}