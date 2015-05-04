package crawlingtosea.loaders
{
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.utils.CompressionAlgorithm;
	
	import crawlingtosea.core.c2debug;
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.LoaderEvent;
	import crawlingtosea.methods.CheckoutType;
	import crawlingtosea.methods.GetSuffix;
	
	/**
	 * 同类加载而非混合加载。可以加载的类型有JPG,PNG,GIF,XML,SWF。
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	[Event(name="ai_multicompleted_meidacompleted", type="crawlingtosea.events.LoaderEvent")]
	[Event(name="ai_multicompleted_textcompleted", type="crawlingtosea.events.LoaderEvent")]
	[Event(name="completed", type="crawlingtosea.events.QueueEvent")]
	
	use namespace c2debug;
	
	public class _AIMultiLoader extends EventDispatcher
	{
	
		////////////////////////////////////////////////////////////////
		//存放数据的数组
		////////////////////////////////////////////////////////////////
	
		
		////////////////////////////////////////////////////////////////	
		//数组处理范畴
		////////////////////////////////////////////////////////////////
		
		private var _urlloader:URLLoader;
		private var _loader:Loader;
		private var _byteArray:ByteArray;
		private var _uid:int=0;
		private var _displayObject:DisplayObject;
		private var _stringType:String="";
		private var _text:String="";
		
		
		public function _AIMultiLoader(data:*=null)
		{
			
			switch(CheckoutType(data))
			{
				case String:
					//trace("string");
					
					checkStringAndLoadData(data as String);
					break;
				case Array:
					trace("arrau");
					break;
				case XML:
					trace("xml");
					break;
				default:
					throw new Error(Debug.Error_TypeIsWrong);
					break;
			}
				
			
		}
		
		////////////////////////////////////////////////////////////////
		//getter/setter方法
		////////////////////////////////////////////////////////////////

	
		public function get displayObject():DisplayObject
		{
			return _displayObject;
		}

		public function get text():String
		{
			return _text;
		}

		/**
		 * 单项加载 
		 * @param data
		 * 
		 */		
		protected function checkStringAndLoadData(data:String=null):void
		{
		    initURLLoad();	
			
			switch(GetSuffix(data))
			{
				case "swf":
					initMediaLoad(data);
					break;
				case "jpg":
					initMediaLoad(data);
					break;
				case "png":
					initMediaLoad(data);
					break;
				case "txt":
					initTextLoad(data);
					break;
				default:
					break;
			}
			
		}
		protected function initURLLoad():void
		{
			_urlloader=new URLLoader();
			_urlloader.addEventListener(Event.COMPLETE,onURLLoader);
		}
		protected function initTextLoad(url:String=null):void
		{
			_stringType="text";
			_urlloader.dataFormat=URLLoaderDataFormat.TEXT;
			_urlloader.load(new URLRequest(url));
			//trace("load this");
		}
		
		protected function initMediaLoad(url:String=null):void
		{
			_stringType="media";
			_urlloader.dataFormat=URLLoaderDataFormat.BINARY;
			_urlloader.load(new URLRequest(url));
		}
		
		protected function onURLLoader(event:Event):void
		{
			// TODO Auto-generated method stub
			if(_stringType=="text")
			{
				_text=event.target.data as String;
				dispatchEvent(new LoaderEvent(LoaderEvent.AI_COMPLETED));
			}
			else
			{
		       _byteArray=event.target.data as ByteArray;
			   _byteArray.compress(CompressionAlgorithm.ZLIB);
			   dispatchEvent(new Event("medialoaded"));
			}	
		}	
			
		public function startLoad():void
		{
			addEventListener("medialoaded",onMediaLoaded);
			
		}
		
		protected function onMediaLoaded(event:Event):void
		{
			// TODO Auto-generated method stub
			_loader=new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderEvent);
			_byteArray.uncompress(CompressionAlgorithm.ZLIB);
			_loader.loadBytes(_byteArray);
		}
		
		protected function onLoaderEvent(event:Event):void
		{
			// TODO Auto-generated method stub
			_displayObject=event.target.content;
			dispatchEvent(new LoaderEvent(LoaderEvent.AI_COMPLETED));
		}
		
	
		c2debug function substr(obj:*):String
		{
			return String(obj).split(" ")[1].substr(0,-1);
		}
		
	}
}