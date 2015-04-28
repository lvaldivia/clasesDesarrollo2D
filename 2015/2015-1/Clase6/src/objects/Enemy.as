package objects 
{
	import utils.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Enemy extends DGameObject 
	{
		
		public function Enemy() 
		{
			super();
			currentClip = "skin_enemy";
		}
		
		override public function init():void {
			super.init();
			x = -width / 2;
			y = Math.random() * (stage.stageHeight - (height / 2));
		}
		
		override public function update():void {
			x += 2;
			if (x > stage.stageWidth + (width / 2)) {
				outOfBounds = true;
				parent.removeChild(this);
			}
			super.update();
		}
		
	}

}