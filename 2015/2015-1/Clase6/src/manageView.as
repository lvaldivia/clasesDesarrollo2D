package 
{
	import com.greensock.TweenLite;
	import events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.DView;
	import views.Game;
	import views.Menu;
	
	/**
	 * ...
	 * @author 
	 */
	public class manageView extends Sprite 
	{
		private var current:DView;
		private var old:DView;
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			current = new Menu();
			addChild(current);
			current.x = current.width;
			TweenLite.to(current, 0.5, { x:0,delay:0.5,onComplete:current.initAnim } );
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			old = current;
			TweenLite.to(old, 0.5, { x: -old.width,onComplete:remove } );
			switch (e._view) 
			{
				case 'game':
					current = new Game();
					addChild(current);
				break;
				default:
			}
			current.x = current.width;
			TweenLite.to(current, 0.5, { x:0 } );			
		}

		private function remove():void 
		{
			removeChild(old);
		}
		
	}

}