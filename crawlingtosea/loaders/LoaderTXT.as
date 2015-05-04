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
	 * @class LoaderTXT
	 * @author mengtianwxs
	 * @createTime 2013-11-29
	 */
	
	public class LoaderTXT extends c2loader
	{
		
		private var _data:String;
		private var _urlloader:URLLoader;
		
		public function LoaderTXT(path:String=null)
		{
			super(path);
		}
		
		override public function start():void
		{
			// TODO Auto Generated method stub
			//super.start();
			_urlloader=new URLLoader();
			_urlloader.addEventListener(Event.COMPLETE,onURLComplete,false,0,true);
			try
			{
				_urlloader.load(new URLRequest(path));
			}
			catch(e:IOErrorEvent)
			{
				throw new IOError(Debug.Error_IOIsWrong);
			}
				
		} 
		
		protected function onURLComplete(e:Event):void
		{
			_urlloader.removeEventListener(Event.COMPLETE,onURLComplete);
			_data=_urlloader.data as String;
			dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETED));
			
		}
		
		
		
		override public function get data():Object
		{
			// TODO Auto Generated method stub
			return _data as String;
		}
		
		
	}
}