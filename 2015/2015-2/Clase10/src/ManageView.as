package 
{
	import starling.display.Sprite;
	import Utils.states.DStateManager;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class ManageView extends Sprite 
	{
		
		public function ManageView() 
		{
			super();
			
		}
		
		public function start():void{
			DStateManager.init(this);
			DStateManager.register("game", Game);
			DStateManager.start("game");
		}
		
	}

}