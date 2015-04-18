package crawlingtosea.loaders
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.media.Sound;
	import flash.utils.getDefinitionByName;
	
	import crawlingtosea.core.C2Loader;
	import crawlingtosea.events.LoaderEvent;
	
	
	/**
	 * @class Loaders
	 * @author mengtianwxs
	 * @createTime 2013-11-28
	 */
	
	[Event(name="loaders_completed", type="crawlingtosea.events.LoaderEvent")]
	
	public class Loaders extends EventDispatcher
	{
		
		public static const ParseBitmapMethod:int=0x01;
		public static const ParseSWFMethod:int=0x02;
		public static const ParseXMLMethod:int=0x03;
		public static const ParseTXTMethod:int=0x04;
		
		private  var assetPath:String=null;
		private var _asset:Object=new Object();
		private var _myLoader:Loader=null;
		private var load:C2Loader=null;
		
		public function Loaders(assetPath:String,loaderMethod:int,defaultHandler:Function=null)
		{	
			//trace("write success");
			switch(loaderMethod)
			{
				case ParseBitmapMethod:
					load=new LoaderBitmap(assetPath);	
					break;
				case ParseSWFMethod:
					load=new LoaderSWF(assetPath);
					break;
				case ParseXMLMethod:
					load=new LoaderXML(assetPath);
					break;
				case ParseTXTMethod:
					load=new LoaderTXT(assetPath);
					break;
				default:
					break;
				
			}
			
			/*
				load.addEventListener(LoaderEvent.COMPLETED,onCompletedHandler,false,0,true);
				load.start();
				
				function onCompletedHandler(event:LoaderEvent):void
				{
					
				}*/
			start();
			
			//注册事件
			if(defaultHandler!= null)
			{
				this.addEventListener(LoaderEvent.LOADERS_COMPLETED,defaultHandler);			
			}
		}
		
		protected function start():void
		{
			load.addEventListener(LoaderEvent.COMPLETED,onCompletedHandler);
			load.start();
		}
		
		protected function onCompletedHandler(event:LoaderEvent):void
		{
			load.removeEventListener(LoaderEvent.COMPLETED,onCompletedHandler);
			_asset=load.data;
			_myLoader=load.load as Loader;
			this.dispatchEvent(new LoaderEvent(LoaderEvent.LOADERS_COMPLETED));
			
		}
		
		/*
		public function ParseAndLoadAsset(assetPath:String,loaderMethod:int):void
		{
			var load:C2Loader=null;
			
			switch(loaderMethod)
			{
				case ParseBitmapMethod:
					load=new LoaderBitmap(assetPath);	
					
					break;
				case ParseSWFMethod:
					load=new LoaderSWF(assetPath);
					break;
				case ParseXMLMethod:
					load=new LoaderXML(assetPath);
					break;
				case ParseTXTMethod:
					load=new LoaderTXT(assetPath);
					break;
				default:
					return ;
			}
			load.addEventListener(LoaderEvent.COMPLETED,onCompleted);
			load.start();
			function onCompleted(e:LoaderEvent):void
			{
				load.removeEventListener(LoaderEvent.COMPLETED,onCompleted);
				asset=load.data;
				dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETED));
				
			}
		}*/

		public function get asset():Object
		{
			return _asset;
		}
		
		public function get bitmapData():BitmapData
		{
			return (_asset as Bitmap).bitmapData;
		}
		
		public function get bitmap():Bitmap
		{
			return _asset as Bitmap;
		}
		
		public function get txt():String
		{
			return _asset as String;
		}
		
		public function get xml():XML
		{
			return _asset as XML;
		}
		public function get loader():Loader
		{
			return _myLoader;
		}
		
		public function getBitmapDataByName(className:String=null):BitmapData
		{
			var c:Class=getDefinitionByName(className) as Class;
			var bd:BitmapData=new c() as BitmapData;
			return bd;
		}
		
		public function getBitmapByName(className:String=null):Bitmap
		{
			var c:Class=getDefinitionByName(className) as Class;
			var b:Bitmap=new Bitmap(new c() as BitmapData);
			return b;
		}
		
		public function getMovieClipByName(className:String=null):MovieClip
		{
			var c:Class=getDefinitionByName(className) as Class;
			var m:MovieClip=new c();
			return m;
		}
		
	/*	public function getAV1MovieByName(className:String=null):AVM1Movie
		{
			var c:Class=getDefinitionByName(className) as Class;
			var m1:AVM1Movie=new c as AVM1Movie;
			return m1;
		}*/
		
		public function getSoundByName(className:String=null):Sound
		{
			var sc:Class=getDefinitionByName(className)as Class;
			var s:Sound=new sc() as Sound;
			return s;
		}

	}
}