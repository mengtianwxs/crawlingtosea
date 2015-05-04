package crawlingtosea.loaders
{
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import crawlingtosea.core.c2loader;
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.LoaderEvent;
	
	
	/**
	 * 加载XML。
	 * @author mengtianwxs
	 * @createTime 2013-3-22
	 */	
	
	public class LoaderXML extends c2loader
	{
		
		private var _urlLoader:URLLoader;
		private var _data:XML;
		
		public function LoaderXML(path:String=null)
		{
			super(path);
		}
		
		override public function start():void
		{
			_urlLoader=new URLLoader();
			_urlLoader.addEventListener(Event.COMPLETE,onXMLComplete,false,0,true);
			try
			{
				_urlLoader.load(new URLRequest(path));
			}
			catch(e:IOErrorEvent)
			{
				throw new IOError(Debug.Error_IOIsWrong);
			}
			
		}
		
		protected function onXMLComplete(event:Event):void
		{
			_urlLoader.removeEventListener(Event.COMPLETE,onXMLComplete);
			parseXMLString(_urlLoader.data as String);
			
			dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETED));
			
		}
		
		protected function parseXMLString(string:String=null):void
		{
			_data=new XML(string);
		}
		
		override public function get data():Object
		{
			return _data as XML;
		}
	}
}