package views 
{
	import events.NavigationEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author ISIL
	 */
	public class Instructions extends Sprite
	{
		private var content:MovieClip;
		
		public function Instructions() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			var c:Class = Global.assets.getDefinition('intro') as Class;
			content = new c();
			addChild(content);
			content.btnJugar.buttonMode = true;
			content.btnJugar.addEventListener(MouseEvent.CLICK, play);
		}
		
		private function removed(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			removeChild(content);
			content.btnJugar.removeEventListener(MouseEvent.CLICK, play);
		}
		
		private function play(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, { next_view:'game' } ));
		}
		
	}

}