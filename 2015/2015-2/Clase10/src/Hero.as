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
			if(x<0){
				x = 0;
			}
			if(x>Global.map_width-width){
				x = Global.map_width-width;
			}
			if(y<0){
				y = 0;
			}
			if(y>Global.map_height-height){
				y = Global.map_height-height;
			}
			
		}
		
	}

}