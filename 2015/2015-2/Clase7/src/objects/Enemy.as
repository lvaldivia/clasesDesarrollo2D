package objects 
{
	import com.greensock.TweenLite;
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Enemy extends DGameObject
	{
		public function Enemy(clip:String='skin_enemy') 
		{
			super (clip);	
		}
		
		override public function update():void
		{
			super.update();			
			if (isAlive) {
				y += 2;
				if (y >= stage.stageHeight + height / 2) {
					outOfBounds = true;
					kill();
				}
			}
		}
		
		
		override public function kill():void {
			if (!isHurt) {
				TweenLite.to(this, 1, { scaleX:0, scaleY:0, onComplete:endKill } );
				isHurt = true;
			}
			
		}
		
		private function endKill():void 
		{
			super.kill();
			isHurt = false;
			scaleX = scaleY = 1;
		}
		
	}

}