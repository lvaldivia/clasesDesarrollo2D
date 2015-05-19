package game.objects 
{
	import flash.filters.ColorMatrixFilter;
	import utils.DMath;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends DGameObject 
	{
		private var direction:int;
		public function Enemy() 
		{
			super();
			currentClip = 'Red';
		}
		
		override public function init():void {
			super.init();
			alpha = 0.8;
			var rnd:Number = Math.random();
			if (rnd > 0.5) {
				x = -width / 2;
				direction = 1;
			}else {
				direction = -1;
				x = stage.stageWidth + (width / 2);
			}
			scaleX = direction;
			y = DMath.randRange(height / 2, 
				stage.stageHeight - (height / 2));
		}
		
		override public function update():void {
			super.update();
			x += 5 * direction;
			if (x > stage.stageWidth + (width / 2) && direction == 1) {
				outOfBounds = true;
			}
			if (x<-width/2 && direction ==-1) {
				outOfBounds = true;
			}
		}
		
	}

}