package  src.views
{
	import src.events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import src.views.HomeView;
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite
	{
		private var currentView:Sprite;
		public function manageView() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			currentView = new HomeView();
			addChild(currentView);
			this.addEventListener(NavigationEvent.CHANGE_VIEW, cambiarVista);
		}
		
		private function cambiarVista(e:NavigationEvent):void 
		{
			trace("cambiamos vista");
		}
		
	}

}