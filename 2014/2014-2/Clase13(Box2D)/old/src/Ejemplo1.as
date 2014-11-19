package 
{
	import Box2D.Collision.b2AABB;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Luis
	 */
	public class Ejemplo1 extends Sprite
	{
		private var world:b2World;
		private var worldScale:int=30;
		private var circleSpeed:int=5;
		private var color:Sprite;
		
		public function Ejemplo1() 
		{
			addEventListener(Event.ADDED_TO_STAGE, added);
		}
		
		private function added(e:Event):void 
		{
			world = new b2World(new b2Vec2(0, 10), true);
			
			color = new Sprite();
			color.graphics.beginFill(0xFF0000);
			color.graphics.drawCircle(0, 0, 10);
			//addChild(color);
            debugDraw();
			var contactListener:CustomContactListener = new CustomContactListener();
			world.SetContactListener(contactListener);
            addBox(400,480,900,20,b2Body.b2_staticBody);
            addBox(400,0,900,20,b2Body.b2_staticBody);
			addBox(0, 340, 20, 800, b2Body.b2_staticBody);
			addBox(800,340,20,800,b2Body.b2_staticBody);
			
             //for (var i:int=0; i<10; i++) {
                //kinematicSphere(640*(i%2),50+40*i,10,(1-2*(i%2))*(Math.random()*10+5));
            //}
			 //for (var p:Number=1; p<=10; p++) {
                addCircle();
            //}
			
            addEventListener(Event.ENTER_FRAME,update);
		}
		
		 private function addBox(pX:Number,pY:Number,w:Number,h:Number,bodyType:Number):void {
            var bodyDef:b2BodyDef=new b2BodyDef();
            bodyDef.position.Set(pX/worldScale,pY/worldScale);
            bodyDef.type=bodyType;
            var polygonShape:b2PolygonShape=new b2PolygonShape();
            polygonShape.SetAsBox(w/2/worldScale,h/2/worldScale);
            var fixtureDef:b2FixtureDef=new b2FixtureDef();
            fixtureDef.shape=polygonShape;
            fixtureDef.density=1;
            fixtureDef.restitution=0.4;
            fixtureDef.friction=0.5;
            var body:b2Body=world.CreateBody(bodyDef);
            body.CreateFixture(fixtureDef);
        }
		
		private function addCircle():void {
            var bodyDef:b2BodyDef= new b2BodyDef();
            bodyDef.type = b2Body.b2_dynamicBody;
            bodyDef.position.Set(Math.round(Math.random()*600+20)/worldScale,Math.round(Math.random()*440+20)/worldScale);
            var circleShape:b2CircleShape = new b2CircleShape(10/worldScale);
            var fixtureDef:b2FixtureDef = new b2FixtureDef();
            fixtureDef.density=1;
            fixtureDef.friction=1;
            fixtureDef.restitution=0.5;
            fixtureDef.shape=circleShape;
            var body:b2Body=world.CreateBody(bodyDef);
            body.CreateFixture(fixtureDef);
            var randomAngle:Number=Math.random()*2*Math.PI;
            body.SetLinearVelocity(new b2Vec2(circleSpeed*Math.cos(randomAngle),circleSpeed*Math.sin(randomAngle)));
        }
		
        private function debugDraw():void {
            var debugDraw:b2DebugDraw=new b2DebugDraw();
            var debugSprite:Sprite=new Sprite();
            addChild(debugSprite);
            debugDraw.SetSprite(debugSprite);
            debugDraw.SetDrawScale(worldScale);
            debugDraw.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
            debugDraw.SetFillAlpha(0.5);
            world.SetDebugDraw(debugDraw);
        }
        private function update(e:Event):void {
            world.Step(1/30,10,10);
            world.ClearForces();
			for (var b:b2Body = world.GetBodyList(); b; b = b.GetNext()) {
                if (b.GetType()==b2Body.b2_kinematicBody) {
                    var xSpeed:Number=b.GetLinearVelocity().x;
                    var xPos:Number=b.GetWorldCenter().x*worldScale;
                    if ((xPos<10&&xSpeed<0) || (xPos>630&&xSpeed>0)) {
                        xSpeed*=-1;
                        b.SetLinearVelocity(new b2Vec2(xSpeed,0));
                    }
                }
            }
            world.DrawDebugData();
        }
		
		 private function kinematicSphere(pX:int,pY:int,r:Number,hV):void {
            var bodyDef:b2BodyDef=new b2BodyDef();
            bodyDef.position.Set(pX/worldScale,pY/worldScale);
            bodyDef.type=b2Body.b2_kinematicBody;
            var circleShape:b2CircleShape=new b2CircleShape(r/worldScale);
            var fixtureDef:b2FixtureDef=new b2FixtureDef();
            fixtureDef.shape=circleShape;
            var theKinematic:b2Body=world.CreateBody(bodyDef);
            theKinematic.CreateFixture(fixtureDef);
            theKinematic.SetLinearVelocity(new b2Vec2(hV,0));
        }
	}
}