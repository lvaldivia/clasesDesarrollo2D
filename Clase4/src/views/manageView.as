package src.views 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author ISIL
	 */
	public class manageView extends Sprite
	{
		private var home:Home;
		public function manageView() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			trace("agregamos scena");
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			home = new Home();
			addChild(home);
		}
		
	}

}