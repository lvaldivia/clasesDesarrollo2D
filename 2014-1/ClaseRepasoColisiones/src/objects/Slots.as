package src.objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Slots extends Sprite 
	{
		private var isCreated:Boolean;
		private var _canon:Canon;
		public function Slots() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			graphics.beginFill(0x666666);
			graphics.drawRect(0, 0, 50, 50);
			graphics.endFill();
			buttonMode = true;
			addEventListener(MouseEvent.CLICK, click);
		}
		
		public function update(posX:Number, posY:Number):void {
			if(canon!=null){
				if(y==posY){
					if (posX-x <= 20) {
						trace("dispara");
					}
				}
			}
		}
		
		private function click(e:MouseEvent):void 
		{
			if (!isCreated) {
				isCreated = true;
				canon = new Canon();
				canon.x = width / 2;
				canon.y = height / 2;
				this.addChild(canon);
			}
		}
		
		public function get canon():Canon 
		{
			return _canon;
		}
		
		public function set canon(value:Canon):void 
		{
			_canon = value;
		}
		
	}

}