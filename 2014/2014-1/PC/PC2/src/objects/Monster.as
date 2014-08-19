package src.objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.events.GameEvent;
	import com.greensock.TweenLite;
	import com.greensock.plugins.BlurFilterPlugin
	import com.greensock.plugins.TweenPlugin;
	
	/**
	 * ...
	 * @author Sebastián Blanco
	 */
	public class Monster extends Sprite 
	{
		private var _skin:MovieClip;
		private var _countingTime:Number = 0;
		private var _health:int;
		
		public function Monster() 
		{
			super();
			TweenPlugin.activate([BlurFilterPlugin]);
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_skin = new monster_object();
			_skin.x = 0;
			_skin.y = Math.random() * stage.stageHeight;
			addChild(_skin);
			
			_health = Math.random() * 3;
			
			addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			TweenLite.to(_skin, 0.3, {blurFilter:{blurX:20},onComplete:terminarBlur});
			_health--;
			if (_health <= 0) {
				removeEventListener(MouseEvent.CLICK, onClick);
				dispatchEvent(new GameEvent(GameEvent.MONSTER_DOWN, true));
				removeChild(_skin);
			}
		}
		
		private function terminarBlur():void 
		{
			TweenLite.to(_skin, 0.3, {blurFilter:{blurX:0}});
		}
		
		public function update(_deltaTime:Number):void {
			_countingTime += _deltaTime;
			if (_countingTime >= 200) {
				_countingTime = 0;
				x += 2;
			}
		}
	}

}