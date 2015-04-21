package views 
{
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import objects.Bullet;
	import objects.Enemy;
	import objects.Hero;
	import utils.DKeyboard;
	import utils.DTempo;
	import utils.DView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Game extends DView 
	{
		private var hero:Hero;
		private var enemys:Vector.<Enemy>;
		private var timer:Timer;
		private var bullets:Vector.<Bullet>;
		private var elapsedCreation:Number = 0;
		private var elapsedBullet:Number = 0;
		
		public function Game() 
		{
			super();
			currentClip = "mc_background";
		}
		
		override public function init():void {
			super.init();
			enemys = new Vector.<Enemy>();
			bullets = new Vector.<Bullet>();
			hero = new Hero();
			addChild(hero);
			DKeyboard.init(stage);
			DTempo.start();
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			
		}
		
		private function loop(e:Event):void 
		{
			hero.update();
			DTempo.update();
			elapsedCreation += DTempo.dt;
			elapsedBullet += DTempo.dt;
			if (DKeyboard.spacePress) {
				if (elapsedBullet >= 0.2) {
					var bullet:Bullet = new Bullet(hero.x, hero.y);
					addChild(bullet);
					bullets.push(bullet);
					elapsedBullet = 0;
				}
				
			}
			if (elapsedCreation >= 1) {
				var enemy:Enemy = new Enemy();
				addChild(enemy);
				enemys.push(enemy);
				elapsedCreation = 0;
			}
			var total:int = enemys.length;
			var totalBullets:int = bullets.length;
			for (var j:int = 0; j < totalBullets; j++) 
			{
				bullets[j].update();
				if (bullets[j].outOfBounds) {
					bullets.splice(j, 1);
					totalBullets--;
				}else{
					for (var k:int = 0; k < total; k++) 
					{
						if(bullets.length>j){
							if (bullets[j].hitBitmap(enemys[k].bmd, enemys[k].bmdPoints)) {
								removeChild(bullets[j]);
								removeChild(enemys[k]);
								bullets.splice(j, 1);
								enemys.splice(k, 1);
								totalBullets--;
								total--;
							}
						}
					}
				}
			}
			for (var i:int = 0; i < total; i++) 
			{
				enemys[i].update();
				if (enemys[i].hitBitmap(hero.bmd,hero.bmdPoints)) {
					removeChild(enemys[i]);
					enemys.splice(i, 1);
					total--;
				}else {
					if (enemys[i].outOfBounds) {
						enemys.splice(i, 1);
						total--;
					}
				}
				
			}
		}
		
	}

}