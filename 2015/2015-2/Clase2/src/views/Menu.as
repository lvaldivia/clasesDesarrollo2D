package views 
{
	import flash.events.MouseEvent;
	import utils.states.DState;
	import utils.states.DStateManager;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Menu extends DState
	{
		
		public function Menu() 
		{
			super('view_main');
		}
		
		override public function init():void {
			super.init();
			skin.btnPlay.addEventListener(MouseEvent.CLICK, click);
			skin.btnPlay.buttonMode = true;
		}
		
		private function click(e:MouseEvent):void 
		{
			DStateManager.start("game");
		}
		
		override public function destroy():void {
			skin.btnPlay.removeEventListener(MouseEvent.CLICK, click);
			super.destroy();
		}
		
		
		
	}

}