package
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="640",height="960",frameRate="60")]
	public class StarlingDemo1 extends Sprite
	{
		private var s:Starling;
		public function StarlingDemo1()
		{
			s=new Starling(Game,stage);
			s.showStats=true;
			s.start();
		}
	}
}