package crawlingtosea.loaders
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import crawlingtosea.core.C2Loader;
	import crawlingtosea.debug.Config;
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.LoaderEvent;
	
	
	/**
	 * 加载位图。
	 * @author mengtianwxs
	 * @createTime 2013-3-22
	 */	
	
	public class LoaderBitmap extends C2Loader
	{
		
		private var _data:Bitmap;
		private var _isFullScreen:Boolean;
		
		public function LoaderBitmap(path:String=null,isFullScreen:Boolean=false)
		{
			super(path);
			this._isFullScreen=isFullScreen;
		}
		
		override public function start():void
		{
			//_loader=new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onBMPComplete,false,0,true);
			
			try
			{
				_loader.load(new URLRequest(path));
			}
			catch(e:IOError)
			{
				throw new IOError(Debug.Error_URLIsWrong);
			}
		}
		
		protected function onBMPComplete(event:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onBMPComplete);
			
			_data=Bitmap(_loader.content);
			dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETED));
		}
		
		override public function get data():Object
		{
			if(_isFullScreen)
			{
				_data.width=Config.sw;
				_data.height=Config.sh;
			}
			return _data as Bitmap;
		}
		
		public function get bitmapData():BitmapData
		{
			return _data.bitmapData;
		}
		
		
	}
}