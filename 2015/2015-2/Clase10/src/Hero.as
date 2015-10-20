package 
{
	import Utils.input.DKeyboard;
	import Utils.objects.DGameObject;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class Hero extends DGameObject 
	{
		
		public function Hero() 
		{
			super("hero0000");			
		}
		
		override public function update():void{
			super.update();
			if(DKeyboard.leftPress){
				x -= 5;
			}
			if(DKeyboard.rightPress){
				x += 5;
			}
			if(DKeyboard.upPress){
				y -= 5;
			}
			if(DKeyboard.downPress){
				y += 5;
			}
		}
		
	}

}