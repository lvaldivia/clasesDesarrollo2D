package views 
{
	
	import flash.events.MouseEvent;
	import utils.states.Dstate;
	import utils.states.DstateManager;
	
	/**
	 * ...
	 * @author Alejandro
	 */
	public class Menu extends Dstate
	{
		public function Menu()
		{
			super('view_main'); // sirve para llamar y para poner parametros dentro del ( 1,2,3,4, parametros)
		}
		override public function init():void
		{
			super.init();
			skin.btnPlay.addEventListener(MouseEvent.CLICK, click);
			skin.btnPlay.buttonMode = true;
		}
		private function click(e:MouseEvent):void
		{
			DstateManager.start("game");
		}
		override public function destroy():void
		{
			skin.btnPlay.removeEventListener(MouseEvent.CLICK, click);
			super.destroy();
		}
	}

}