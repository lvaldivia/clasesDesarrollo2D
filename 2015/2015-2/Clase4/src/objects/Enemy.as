package objects 
{
	import utils.objects.DGameObject;
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Enemy extends DGameObject
	{
		
		public function Enemy() 
		{
		 super ('skin_enemy');	
			
		}
		override public function update():void
		{
			
			super.update();			
			y += 2;
			
			
		}
		
	}

}