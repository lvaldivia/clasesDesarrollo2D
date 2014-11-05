package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source = "../graphics/spritesheet.png")]
		private static var texture:Class; 
		
		[Embed(source = "../graphics/spritesheet.xml", mimeType = "application/octet-stream")]
		private static var textureXML:Class;
		
		[Embed(source = "../graphics/start_button.png")]
		private static var start_btn:Class;
		
		
		private static var gameTextureAtlas:TextureAtlas;
		private static var gameTextures:Dictionary=new Dictionary();
		
		
		public static function getAtlas():TextureAtlas{
			if(gameTextureAtlas==null){
				var texture:Texture=getTexture('texture');
				var xml:XML=XML(new textureXML());
				gameTextureAtlas=new TextureAtlas(texture,xml);
			}
			return gameTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			if(gameTextures[name]==undefined){
				var bitmap:Bitmap=new Assets[name]();
				var texture:Texture=Texture.fromBitmap(bitmap);
				gameTextures[name]=texture;
			}
			return gameTextures[name]
			
		}
		
	}
}