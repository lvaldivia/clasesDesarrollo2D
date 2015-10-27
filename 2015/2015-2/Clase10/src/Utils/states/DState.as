package Utils.states
{
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import Utils.objects.DGameObject;
	import Utils.start.DStarling;
	import Utils.states.camera.DGameCamera;
	import Utils.time.DTempo;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class DState extends Sprite
	{
		private var targetCamera:DGameObject;
		protected var skin:Image;
		protected var clip:String;
		protected var hasLoop:Boolean;
		protected var deltaTime:Number;
		protected var camera:DGameCamera;
		
		public function DState(_clip:String = "", _loop:Boolean = true)
		{
			clip = _clip;
			hasLoop = _loop;
			deltaTime = 0;
			DTempo.init();
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			init();
			if (hasLoop)
			{
				stage.addEventListener(Event.ENTER_FRAME, loop);
			}
			addEventListener(Event.REMOVED_FROM_STAGE, removed);
		}
		
		protected function setUpCamera(_cameraTarget:DGameObject, bounds:Rectangle):void {
			targetCamera = _cameraTarget;
			camera = new DGameCamera(this, bounds);
		}
		
		private function loop(e:Event):void 
		{
			DTempo.update();
			update();
		}
		
		public function update():void 
		{
			deltaTime = DTempo.dt;
			if(camera!=null){
				camera.go(targetCamera.x, targetCamera.y);
			}
		}
		
		private function removed(e:Event):void
		{
			if (hasLoop) {
				stage.removeEventListener(Event.ENTER_FRAME, loop);
			}
			removeEventListener(Event.REMOVED_FROM_STAGE, removed);
			destroy();
		}
		
		public function destroy():void
		{
			removeChildren();
		}
		
		public function init():void
		{
			if (clip !== '')
			{
				skin = new Image(DStarling.assetsManager.getTexture(clip));
				addChild(skin);
			}
			else
			{
				var quad:Quad = new Quad(stage.stageWidth, stage.stageHeight, 0x00FF00);
				addChild(quad);
			}
		
		}
	
	}

}