package  
{
	import events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import views.Game;
	import views.Instrucciones;
	import views.Menu;
	/**
	 * ...
	 * @author ISIL
	 */
	public class ManageView extends Sprite
	{
		private var current:Sprite;
		private var old:Sprite;
		public function ManageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			current = new Menu();
			addChild(current);
			addEventListener(NavigationEvent.CHANGE_VIEW, cambiarVista);
		}
		
		private function cambiarVista(e:NavigationEvent):void 
		{
			old = current;
			if(e.next=='intro'){
				current = new Instrucciones();
			}
			if (e.next == 'game'){
				current = new Game();
			}
			addChild(current);
			removeChild(old);
			
		}
		
	}

}