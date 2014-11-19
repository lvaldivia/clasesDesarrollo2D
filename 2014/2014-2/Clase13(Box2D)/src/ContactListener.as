package  
{
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.Contacts.b2Contact;
	/**
	 * ...
	 * @author ISIL
	 */
	public class ContactListener extends b2ContactListener
	{
		
		public function ContactListener() 
		{
			
		}
		
		override public function BeginContact(contact:b2Contact):void 
		{
			trace(contact.GetFixtureA().GetUserData().name);
			trace(contact.GetFixtureB().GetUserData().name);
		}
		
	}

}