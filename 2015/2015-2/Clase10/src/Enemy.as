package 
{
	import Utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Enemy extends DGameObject 
	{
		
		private var distanceX:Number;
		private var distanceY:Number;
		private var distanceTotal:Number;
		private var moveDistanceX:Number;
		private var moveDistanceY:Number;
		private var moveX:Number;
		private var moveY:Number;
		private var totalMove:Number;
		private var speed:Number;
		private var turnRate:Number;
		private var agroRange:Number;
		private var mode:String;
		private var target:Hero;
		
		public function Enemy(_target:Hero) 
		{
			super("enemy0000");
			target = _target;
			distanceX = 0;
			distanceY = 0;
			distanceTotal = 0;
			moveDistanceX = 0;
			moveDistanceY = 0;
			moveX = 0;
			moveY = 0;
			totalMove = 0;
			agroRange = 200;
			speed = 3;
			turnRate = 0.3;
		}
		
		override public function init():void{
			super.init();
			x = Math.random() * stage.stageWidth;
			y = Math.random() * stage.stageHeight;
		}
		
		override public function update():void {
			super.update();
			distanceX = target.x - x;
			distanceY = target.y - y;
			distanceTotal = Math.sqrt(
				distanceX * distanceX + 
				distanceY * distanceY);
				
			if(distanceTotal<=agroRange){
				moveDistanceX = turnRate * distanceX / 
								distanceTotal;
				moveDistanceY = turnRate * distanceY / 
								distanceTotal;
			
				moveX += moveDistanceX;
				moveY += moveDistanceY;

				totalMove = Math.sqrt(moveX * moveX + 
								moveY * moveY);
								//trace(totalMove);
								
				moveX = speed * moveX / totalMove;
				moveY = speed * moveY / totalMove;
				x += moveX;
				y += moveY;	
				//rotation = Math.atan2(moveY, moveX) 
			}
			
		}
		
	}

}