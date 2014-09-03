package views 
{
	import com.greensock.easing.Strong;
	import com.greensock.events.TweenEvent;
	import com.greensock.TimelineMax;
	import com.greensock.TweenLite;
	import events.NavigationEvent;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TintPlugin;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Menu extends Sprite
	{
		private var container:Sprite;
		private var timeline:TimelineMax;
		
		public function Menu() 
		{
			super();
			TweenPlugin.activate([GlowFilter,TintPlugin,BlurFilter]);
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
			container = new Sprite();
			container.graphics.beginFill(Math.random() * 0xFF00FF);
			container.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
			container.graphics.endFill();
			//addChild(container);
			//TweenLite.to(container, 1, { x:100, y:100, alpha:0.5 } );
			timeline = new TimelineMax();
			for (var i:int = 0; i < 5; i++) 
			{
				var cuadrado:MovieClip = new MovieClip();
				cuadrado.graphics.beginFill(Math.random() * 0xFF00FF);
				cuadrado.graphics.drawRect(0, 0, 50, 50);
				cuadrado.graphics.endFill();
				cuadrado.addEventListener(MouseEvent.CLICK, click);
				var _x:Number = Math.random() * stage.stageWidth;
				var _y:Number = Math.random() * stage.stageHeight;
				//timeline.append(new TweenLite(cuadrado, 2, {x:_x,glowFilter:{color:0x6600ff}}));
				timeline.append(new TweenLite(cuadrado, 0.5,{ glowFilter: { color:0x6600ff, alpha:1, blurX:30, blurY:30, strength:2.5 }} ));
				cuadrado.x = i * (cuadrado.width + 10);
				//TweenLite.to(cuadrado, 0.5, { } );
				addChild(cuadrado);
			}
			//timeline.play();
			timeline.addEventListener(TweenEvent.COMPLETE, terminoAnimacion);
			timeline.addEventListener(TweenEvent.REVERSE_COMPLETE, terminoReversa);
		}
		
		private function terminoAnimacion(e:TweenEvent):void 
		{
			timeline.reverse();
		}
		
		private function terminoReversa(e:TweenEvent):void 
		{
			//dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_VIEW,'intro' ,true));
		}
		
		private function removed(e:Event):void 
		{
			trace("removed");
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			while (numChildren>0) 
			{
				removeChildAt(0);
			}
		}
		
		private function click(e:MouseEvent):void 
		{
			
		}
		
	}

}