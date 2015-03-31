package  {
	
	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	
	
	public class Main extends MovieClip {
		
		private var timer:Timer;
		private var counter:int;
		public function Main() {
			var i:int;
			var posY:int = 50;
			var row:int = 0;
			for(i=0; i<10; i++)
			{
				var c:MovieClip = new cuadrado;
				addChild(c);
				var column:int = i%5;
				if(column==0){
					row++
				}
				c.y = posY*row;
				c.x = (column * c.width) + 20;
			}
			/*counter = 0;
			timer = new Timer(1000);
			timer.addEventListener(TimerEvent.TIMER,onTimer);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE,onComplete);
			timer.start();*/
		}
		
		private function onTimer(e:TimerEvent):void{
			/*if(timer.currentCount == 4){
				timer.stop();
			}*/
			var c:MovieClip = new cuadrado();
			addChild(c);
			c.x = Math.random()*stage.stageWidth;
			c.y = Math.random()*stage.stageHeight;
			c.addEventListener(MouseEvent.CLICK,click);
		}
		
		private function click(e:MouseEvent):void{
			var mc:MovieClip = e.currentTarget as MovieClip;
			removeChild(mc);
			counter++;
			if(counter ==4 ){
				timer.stop();
			}
		}
		
		private function onComplete(e:TimerEvent):void{
			trace("onComplete");
		}
	}
	
}
