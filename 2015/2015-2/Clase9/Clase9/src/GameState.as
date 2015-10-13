package 
{
	import citrus.core.State;
	import citrus.objects.platformer.box2d.Coin;
	import citrus.objects.platformer.box2d.Crate;
	import citrus.objects.platformer.box2d.Hero;
	import citrus.objects.platformer.box2d.MovingPlatform;
	import citrus.objects.platformer.box2d.Platform;
	import citrus.physics.box2d.Box2D;
	import citrus.utils.objectmakers.ObjectMaker2D;
	import flash.display.Bitmap;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import objects.MyCoin;
	import objects.MyHero;
	
	/**
	 * ...
	 * @author ISIL
	 */
	public class GameState extends State 
	{
		
		[Embed(source = "../tmx/platformer.tmx", 
		mimeType="application/octet-stream")]
		private var tileMap:Class;
		
		[Embed(source="../tmx/Tileset.png")]
		private var tileView:Class;
		private var box2D:Box2D;
		
		
		public function GameState() 
		{
			super();
			var objects:Array = [Platform, MyHero, MyCoin, Crate, MovingPlatform];
		}
		
		override public function initialize():void{
			super.initialize();
			box2D = new Box2D("box2d");
			box2D.visible = true;
			add(box2D);
			
			var bitmapView:Bitmap = new tileView();
			bitmapView.name = "Tileset.png";
			ObjectMaker2D.FromTiledMap(XML(new tileMap()), [bitmapView]);
			
			var hero:MyHero = getObjectByName("hero") as MyHero;
			trace(hero);
			view.camera.setUp(hero, new Rectangle(0, 0, 1472, 576), 
						new Point(0.5, 0.5));			
		}
		
	}

}