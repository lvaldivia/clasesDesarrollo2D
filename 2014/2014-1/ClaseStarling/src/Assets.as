package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.AtfData;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source="../graphics/background.png")]
		private static const bg:Class;
		
		[Embed(source='../graphics/start_button.png')]
		private static const star_button:Class;
		
		[Embed(source="../graphics/spritesheet.png")]
		private static const atlasTexture:Class;
		
		[Embed(source="../graphics/spritesheet.xml",mimeType="application/octet-stream")]
		private static const atlasXML:Class;
		
		private static var gameTextureAtlas:TextureAtlas;
		private static var gameTextures:Dictionary=new Dictionary();
		
		public static var bgClass:String="bg";
		
		public static function getAtlas():TextureAtlas{
			if(gameTextureAtlas==null){
				var texture:Texture=getTexture('atlasTexture');
				var xml:XML=XML(new atlasXML());
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