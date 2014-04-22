package src.objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import src.events.GameEvent;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Enemy extends Sprite 
	{
		private var tiempoMover:Number;
		private var enemigo:MovieClip;
		private var totalTiempo:Number;
		private var vidas:int;
		private var particles:Vector.<Particle>;
		
		public function Enemy() 
		{
			super();
			totalTiempo = 1;
			vidas = 2;
			particles = new Vector.<Particle>();
			for (var i:int = 0; i < 50; i++) 
			{
				var tmpParticle:Particle = new Particle();
				addChild(tmpParticle);
				particles.push(tmpParticle);
			}
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			enemigo = new almohada();
			enemigo.scaleX = 0.2;
			enemigo.scaleY = 0.2;
			tiempoMover = 0;
			enemigo.y = stage.stageHeight-enemigo.height;
			enemigo.x = Math.random() * stage.stageWidth;
			enemigo.addEventListener(MouseEvent.CLICK, downMorir);
			addChild(enemigo);
		}
		
		private function downMorir(e:MouseEvent):void 
		{
			if (vidas > 0) {
				vidas--;
			}
			if (vidas == 0) {
				enemigo.removeEventListener(MouseEvent.CLICK, downMorir);
				dispatchEvent(new GameEvent(GameEvent.GAME_KILL_MONSTER, true));
				removeChild(enemigo);
				for (var j:int = 0; j < 50; j++) 
				{
					particles[j].updatePos(e.currentTarget.x+(e.currentTarget.width/2), e.currentTarget.y+(e.currentTarget.height/2));
				}
			}

		}
		
		public function update(dt:Number):void {
			tiempoMover += dt;
			if (tiempoMover >= totalTiempo) {
				enemigo.y -= 10;
				tiempoMover = 0;
			}
			for (var j:int = 0; j < 50; j++) 
			{
				particles[j].update();
			}
		}
		
	}

}