package 
{
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
			currentClip = 'player';
			addState("derecha", "playerDer");
			addState("izquierda", "playerIzq");
			addState("arriba" , "player");
			addState("abajo" , "playerDown");
		}
		
	}

}