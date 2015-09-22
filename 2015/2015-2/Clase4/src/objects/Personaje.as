package objects 
{
	
	import utils.input.Dkeyboard;
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Personaje extends DGameObject
	{
		
		
		public function Personaje()
		{
			super ('skin_hero');
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