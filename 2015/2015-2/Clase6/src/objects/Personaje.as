package objects 
{
	
	import com.greensock.TweenLite;
	import utils.input.Dkeyboard;
	import utils.objects.DGameObject;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.ColorTransformPlugin;
	
	
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Personaje extends DGameObject
	{
		
		private var blinks:int = 3;
		public function Personaje()
		{
			TweenPlugin.activate([ColorTransformPlugin]);
			super ('skin_hero');
		}
		
		override public function hurt():void {
			if (!isHurt) {
				isHurt = true;
				bleed1();
				//blinkPart1();
			}
		}
		
		private function bleed1():void 
		{

			TweenLite.to(this, 0.5, { 
						alpha:0.5,
						colorTransform: { tint:0xff0000, 
						tintAmount:0.5},onComplete:bleed2});
		}
		
		private function bleed2():void 
		{
			if (blinks > 0) {
				blinks--;
				TweenLite.to(this, 0.5, { alpha:1,
						colorTransform: { tint:0xff0000, 
						tintAmount:0},onComplete:bleed1});
			}
			if (blinks == 0) {
				blinks = 3;
				isHurt = false;
				TweenLite.to(this, 0, {alpha:1, colorTransform: { tint:0xff0000, 
						tintAmount:0 }} );
				TweenLite.killTweensOf(this);
			}
		}
		
		private function blinkPart1():void 
		{
			TweenLite.to(this, 0.2, { alpha:0.5,onComplete:blinkPart2 } );
		}
		
		private function blinkPart2():void 
		{
			if (blinks > 0) {
				blinks--
				TweenLite.to(this, 0.2, { alpha:1,onComplete:blinkPart1 } );
			}
			if (blinks == 0) {
				blinks = 5;
				TweenLite.killTweensOf(this);
				isHurt = false;
				alpha = 1;
			}
			
		}
		
		override public function update():void
		{
			super.update();
			if (Dkeyboard.left)
			{
				x -= 2;
				if (scaleX != 1)
				{
					scaleX = 1;
				}
								
			}
			if (Dkeyboard.right)
			{
				if (scaleX != -1)
				{
					scaleX = -1;
				}
				 x += 2;
			}
			if (Dkeyboard.Up)
			{
				y -= 2;
				if (scaleY != 1)
				{
					scaleY = 1;
				}
			}
			if (Dkeyboard.Down)
			{
				y += 2;
				if (scaleY != -1)
				{
					scaleY = -1;
				}
			}
		}
	}

}