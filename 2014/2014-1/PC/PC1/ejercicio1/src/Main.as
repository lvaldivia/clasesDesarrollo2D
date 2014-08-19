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
		var posX:Number = 0;
		var posY:Number = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			for (var i:int = 1; i < 11; i++ )
			{
				var poligo:Sprite = new Sprite();
				if (i % 2 == 0)
				{
					poligo.graphics.beginFill(0x15425f);
					poligo.graphics.moveTo(0, 0);
					poligo.graphics.lineTo(20, 0);
					poligo.graphics.lineTo(30, 20);
					poligo.graphics.lineTo(20, 40);
					poligo.graphics.lineTo(0, 40);
					poligo.graphics.lineTo(-10, 20);
					poligo.graphics.endFill();
				}
				else {
					poligo.graphics.beginFill(0x15425f);
					poligo.graphics.moveTo(0, 0);
					poligo.graphics.lineTo(40, 40);
					poligo.graphics.lineTo( -40, 40);
					poligo.graphics.endFill();
				}
				addChild(poligo);
				poligo.x = posX;
				poligo.y = posY;
				posX += 80;
			}
		}
		
	}
	
}