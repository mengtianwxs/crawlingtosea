package crawlingtosea.loaders
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.LoaderEvent;
	
	/**
	 * 智能加载。通过设置xml得到图片的路径，再经过loadImgById()方法加载图片。
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	[Event(name="ai_completed", type="crawlingtosea.events.LoaderEvent")]
	
	public class LoaderBitmaps extends EventDispatcher
	{
		
		private var _xmlpath:String;
		private var _xmlloader:URLLoader;
		private var _imgloader:Loader;
		private var _b:Bitmap;
		private var _array:Vector.<String>;
		
		/**
		 * 结合XML加载一组位图图片 
		 * @param xmlPath
		 * 
		 */		
		public function LoaderBitmaps(xmlPath:String=null)
		{
			_array=new Vector.<String>();
			_xmlloader=new URLLoader();
			_imgloader=new Loader();
			_xmlpath=xmlPath;
			//trace("fixed");
			
		}
		public function loadBitmapById(id:int=0):void
		{
			_xmlloader.addEventListener(Event.COMPLETE,onXMLComplete,false,0,true);	
			_xmlloader.load(new URLRequest(_xmlpath));
			
			function onXMLComplete(e:Event):void
			{
				_xmlloader.removeEventListener(Event.COMPLETE,onXMLComplete);
				
				var xml:XML=new XML(e.target.data);
				parseXML(xml);
				_imgloader.contentLoaderInfo.addEventListener(Event.COMPLETE,onImgComplete,false,0,true);
				_imgloader.load(new URLRequest(_array[id]));
			}
			
			function parseXML(xml:XML):void
			{ 
				
				if(xml.elements().length()>=1)
				{ 
					for each(var element:XML in xml.elements())
					{
						_array.push(element);
						//trace(_array);
					}
				}
				else
				{
					throw new ArgumentError(Debug.Error_XMLFormatIsWrong);
				}
			}
		}
		
		/**
		 * 销毁对象 
		 * 
		 */		
		public function destroyAILoader():void
		{
			
			_xmlloader=null;
			_imgloader=null;
			_array=null;
			
		}
		
		
		///////////////////////////////////////////////////////////////////////
		//注意赋值之后再发送事件
		///////////////////////////////////////////////////////////////////////
		
		private function onImgComplete(e:Event):void
		{
			
			_imgloader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onImgComplete);
			_b=Bitmap(_imgloader.content);
			dispatchEvent(new LoaderEvent(LoaderEvent.AI_COMPLETED));
			//_imgloader.unloadAndStop();
			//此时不能卸载对象
		}
		
		public function getBitmap():Bitmap
		{
			return _b;
		}
		
		/**
		 * 设置路径 
		 * @param value
		 * 
		 */			
		public function set xmlpath(value:String):void
		{
			_xmlpath = value;
		}
	}
}