package Utils.states.camera 
{
	import flash.geom.Rectangle;
	import starling.display.Sprite;
	/**
	 * ...
	 * @author ISIL
	 */
	public class DGameCamera 
	{
		private var canvas:Sprite;
		private var bounds:Rectangle;
		public function DGameCamera(_canvas:Sprite,
				_bounds:Rectangle) 
		{
			canvas = _canvas;
			bounds = _bounds;
		}
		
		public function go(x:Number,y:Number):void{
			var xx:Number = x ;
			var yy:Number = y ;
			var hx:Number = canvas.stage.stageWidth * 0.5;
			var hy:Number = canvas.stage.stageHeight * 0.5;
			
			if (xx - bounds.left  < hx) {
				xx = bounds.left + hx;
			}
			else if (bounds.right  - xx < hx) {
				xx = bounds.right - hx;
			}
			
			if (yy - bounds.top  < hy) 
			{
				yy = bounds.top + hy;
			}
			else if (bounds.bottom  - yy < hy) {
				yy = bounds.bottom - hy;
			}
			
			var tgtx:Number = canvas.stage.stageWidth * 0.5 - xx;
			var tgty:Number = canvas.stage.stageHeight * 0.5 - yy;
			canvas.x = tgtx;
			canvas.y = tgty;
		}
		
	}

}