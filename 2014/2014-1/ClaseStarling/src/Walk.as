package
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Walk extends Sprite
	{
		public function Walk()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE,added);
		}
		
		private function added(e:Event):void{
			removeEventListener(Event.ADDED_TO_STAGE,added);
			var walker:MovieClip=new MovieClip(Assets.getAtlas().getTextures('walking_guy'));
			addChild(walker);
			Starling.juggler.add(walker);
		}
	}
}