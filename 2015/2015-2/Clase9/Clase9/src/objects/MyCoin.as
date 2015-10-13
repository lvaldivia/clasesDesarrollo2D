package objects 
{
	import citrus.objects.platformer.box2d.Coin;
	import utils.loader.DLoader;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class MyCoin extends Coin 
	{
		
		public function MyCoin(name:String, params:Object=null) 
		{
			super(name, params);
			var c:Class = DLoader.getAsset("CoinMC");
			view = new c();
		}
		
	}

}