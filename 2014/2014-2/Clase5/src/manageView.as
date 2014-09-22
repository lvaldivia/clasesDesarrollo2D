package  
{
	import com.greensock.TweenLite;
	import events.NavigationEvent;
	import flash.display.Sprite;
	import flash.events.Event;
	import views.Game;
	import views.Home;
	import views.Instructions;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class manageView extends Sprite
	{
		private var current:Sprite;
		private var prev:Sprite;
		public function manageView() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			current = new Home();
			addChild(current);
			current.y = -current.height;
			TweenLite.to(current, 0.5, { y:0 } );
			addEventListener(NavigationEvent.CHANGE_VIEW, onChangeView);
		}
		
		private function onChangeView(e:NavigationEvent):void 
		{
			prev = current;
			switch (e.props.next_view) 
			{
				case 'intro':
					current = new Instructions();
				break;
				case 'game':
					current = new Game();
				break;
			}
			addChild(current);
			current.y = -current.height;
			TweenLite.to(current, 0.5, { y:0 } );
			TweenLite.to(prev, 0.5, { y:stage.stageHeight, onComplete:removeElement } );
		}
		
		private function removeElement():void 
		{
			removeChild(prev);
		}
	}

}