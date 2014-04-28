package src
{
	import src.events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import src.views.HomeView;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ManageView extends Sprite
	{
		private var currentView;
		
		public function ManageView()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
		}
		
		private function OnAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, OnAddedToStage);
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