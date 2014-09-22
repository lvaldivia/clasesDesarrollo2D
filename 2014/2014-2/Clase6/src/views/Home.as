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
	public class Home extends Sprite 
	{
		private var bg:Sprite;
		private var content:MovieClip;
		public function Home() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			var b:Class = Global.assets.getDefinition('fondo') as Class;
			bg = new b();
			addChild(bg);
			var m:Class = Global.assets.getDefinition('menu') as Class;
			content = new m();
			content.btnJugar.buttonMode = true;
			content.btnJugar.addEventListener(MouseEvent.CLICK, start);
			addChild(content);
		}
		
		private function onRemoved(e:Event):void 
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemoved);
			content.btnJugar.removeEventListener(MouseEvent.CLICK, start);
			removeChild(bg);
			removeChild(content);
		}
		
		private function start(e:MouseEvent):void 
		{
			dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW, 
													{ next_view:'intro', step:1 } ));
		}
		
	}

}