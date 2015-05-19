package game.objects 
{
	import utils.input.DKeyboard;
	import utils.input.DMouse;
	import utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author 
	 */
	public class Hero extends DGameObject 
	{
		
		public function Hero() 
		{
			super();
			currentClip = 'Red';
		}
		
		override public function init():void {
			x = stage.stageWidth / 2;
			y = stage.stageHeight / 2;
			super.init();
			currentState = 'stand';
			addState('stand', 'Red');
			addState('walk', 'Walk');
		}
		
		override public function update():void {
			super.update();
			var angle:Number = Math.atan2(DMouse.y - y, DMouse.x - x);
			rotation = 180 * angle / Math.PI;
			if (DKeyboard.leftPress) {
				x -= 2;
				setState('walk');
				scaleX = -1;
			}
			if (DKeyboard.rightPress) {
				x += 2;
				setState('walk');
				scaleX = 1;
			}
			if (!DKeyboard.leftPress && !DKeyboard.rightPress) {
				setState('stand');
			}
		}
		
	}

}