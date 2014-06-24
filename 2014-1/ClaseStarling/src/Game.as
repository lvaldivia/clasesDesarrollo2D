package
{
	import flash.display.Bitmap;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	
	public class Game extends Sprite
	{
		private var fondo:Image;
		private var button:Button;
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,aded);
		}
		
		private function aded(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE,aded);
			fondo=new Image(Assets.getTexture(Assets.bgClass));
			button=new Button(Assets.getTexture("star_button"));
			stage.addEventListener(Event.TRIGGERED,click);
			addChild(fondo);
			addChild(button);
			var walk:Walk=new Walk();
			addChild(walk);
			stage.addEventListener(TouchEvent.TOUCH,onTouch);
		}
		
		private function onTouch(e:TouchEvent):void
		{
			var t:Touch=e.getTouch(stage,TouchPhase.BEGAN);
			if(t){
				if(t.target.parent is Walk){
					trace("click");	
				}
				
			}
		}
		
		private function click(e:Event):void
		{
			trace("click");
		}
	}
}