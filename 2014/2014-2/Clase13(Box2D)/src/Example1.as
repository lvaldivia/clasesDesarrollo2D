package  
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author ISIL
	 */
	
	public class Example1 extends Sprite
	{
		private var world:b2World;
		private var world_scale:Number = 30;
		private var bodyHero:b2Body;
		public function Example1() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, added);
			var gravity:b2Vec2 = new b2Vec2(0, 10);
			world = new b2World(gravity, true);
			var contactListener:ContactListener = new  ContactListener();
			world.SetContactListener(contactListener);
			debugDraw();
			addBox(900, 50, 400, 320,b2Body.b2_staticBody);
			addBox(900, 50, 400, 0,b2Body.b2_staticBody);
			addBox(50, 270, 0, 160,b2Body.b2_staticBody);
			addBox(50, 270, 790, 160, b2Body.b2_staticBody);
			for (var i:int = 0; i < 10; i++) 
			{
				//addKinematicCircle(Math.random() * 300
						//, Math.random() * 500, 20, b2Body.b2_kinematicBody,10);
			}
			addDynamicBody(100,80);
			stage.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		private function addDynamicBody(pX:Number,pY:Number):void 
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.position.Set(pX / world_scale, pY / world_scale);
			var bodyShape:b2CircleShape = new b2CircleShape(30 / world_scale);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = bodyShape;
			fixtureDef.density=1;
            fixtureDef.friction=1;
            fixtureDef.restitution = 0.5;
			fixtureDef.userData = { name:'hero' };
			bodyHero=world.CreateBody(bodyDef);
            bodyHero.CreateFixture(fixtureDef);
		}
		
		private function loop(e:Event):void 
		{
			world.Step(1 / 30, 10, 10);
			world.ClearForces();
			for (var b:b2Body = world.GetBodyList(); b; b = b.GetNext()) {
				if (b.GetType()==b2Body.b2_kinematicBody) {
                    var xSpeed:Number=b.GetLinearVelocity().x;
                    var xPos:Number=b.GetWorldCenter().x*world_scale;
                    if ((xPos<10&&xSpeed<0) || (xPos>630&&xSpeed>0)) {
                        xSpeed*=-1;
                        b.SetLinearVelocity(new b2Vec2(xSpeed,0));
                    }
                }
			}
			world.DrawDebugData();
		}
		
		private function debugDraw():void{
			var debugDraw:b2DebugDraw=new b2DebugDraw();
            var debugSprite:Sprite=new Sprite();
            addChild(debugSprite);
            debugDraw.SetSprite(debugSprite);
            debugDraw.SetDrawScale(world_scale);
            debugDraw.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
            debugDraw.SetFillAlpha(0.5);
            world.SetDebugDraw(debugDraw);
		}
		
		private function addKinematicCircle(pX:Number, pY:Number,
										r:Number,body_type:int,velX:Number):void {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = body_type;
			bodyDef.position.Set(pX / world_scale, pY / world_scale);
			var bodyShape:b2CircleShape = new b2CircleShape(r / world_scale);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = bodyShape;
			var body:b2Body=world.CreateBody(bodyDef);
            body.CreateFixture(fixtureDef);
			body.SetLinearVelocity(new b2Vec2(velX, 0));
		}
		
		private function addBox(w:Number,h:Number,pX:Number,pY:Number,body_type:int):void {
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.type = body_type;
			bodyDef.position.Set(pX / world_scale, pY / world_scale);
			var bodyShape:b2PolygonShape = new b2PolygonShape();
			bodyShape.SetAsBox(w / 2 / world_scale, h / 2 / world_scale);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = bodyShape;
			fixtureDef.density = 1;
			fixtureDef.friction = 0.5;
			fixtureDef.userData = { name:'wall'};
			var body:b2Body=world.CreateBody(bodyDef);
            body.CreateFixture(fixtureDef);
			
		}
		
	}

}