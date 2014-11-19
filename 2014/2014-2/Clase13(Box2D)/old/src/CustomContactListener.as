package  {
    import Box2D.Dynamics.*;
    import Box2D.Collision.*;
    import Box2D.Dynamics.Joints.*;
    import Box2D.Dynamics.Contacts.*;
    import Box2D.Collision.Shapes.*;
    import Box2D.Common.Math.b2Vec2;
    public class CustomContactListener extends b2ContactListener {
       public function CustomContactListener():void 
	   {
		   
	   }
	   
	   override public function BeginContact(contact:b2Contact):void 
	   {
		   trace(contact.GetFixtureA().GetBody().GetUserData().name, contact.GetFixtureB().GetBody().GetUserData().name );
	   }
	   
    }
}