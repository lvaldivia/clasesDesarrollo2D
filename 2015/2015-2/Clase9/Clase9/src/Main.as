package
{
	import citrus.core.CitrusEngine;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.loader.DLoader;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Main extends CitrusEngine 
	{
		public function Main() 
		{
			super();
		}
		
		override protected function handleAddedToStage(e:Event):void{
			super.handleAddedToStage(e);
			DLoader.load("assets.swf", startGame);
		}
		
		private function startGame():void 
		{
			state = new GameState();
		}
		
		
	}
	
}