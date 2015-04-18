package crawlingtosea.loaders
{
	import flash.display.AVM1Movie;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.MovieClip;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	
	import crawlingtosea.core.C2Loader;
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.LoaderEvent;
	
	
	/**
	 * 加载swf。
	 * @author mengtianwxs
	 * @createTime 2013-3-22
	 */	
	
	public class LoaderSWF extends C2Loader
	{
		
		private var _data:MovieClip;
		private var _AVM1MC:Loader;
		
		/**
		 *  
		 * @param path
		 * 
		 * 下面的代码演示了如何加载过程
		 * @example
		 * <listing version="3">
		 * import crawlingtosea.loaders.LoaderSWF;
		 import crawlingtosea.events.LoaderEvent;
		 
		 var avm1:LoaderSWF = new LoaderSWF("avm1.swf");
		 avm1.addEventListener(LoaderEvent.COMPLETED,onAVM1Complete);
		 
		 
		 var avm2:LoaderSWF = new LoaderSWF("avm2.swf");
		 avm2.addEventListener(LoaderEvent.COMPLETED,onAVM2Complete);
		 function onAVM1Complete(e:LoaderEvent):void
		 {
		 
		 addChild(avm1.AVM1MC);
		 }
		 
		 function onAVM2Complete(e:LoaderEvent):void
		 {
		 
		 addChild(avm2.data);
		 }
		 * </listing>
		 * 
		 */		
		public function LoaderSWF(path:String=null)
		{
			super(path);
		}
		
		public function get AVM1MC():Loader
		{
			return _AVM1MC;
		}

		/**
		 * 
		 * @return 
		 * 
		 */		
		override public function get data():Object
		{
			
			return _data as MovieClip;
		}

		/**
		 * 
		 * 
		 */        
		override public function start():void
		{
			var context:LoaderContext=new LoaderContext();
			context.applicationDomain=ApplicationDomain.currentDomain;
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onSWFComplete,false,0,true);
			try
			{
				_loader.load(new URLRequest(path),context);
			}
			catch(e:IOError)
			{
				throw new IOError(Debug.Error_IOIsWrong);
			}
		}
		/**
		 *  
		 * @param event
		 * 
		 */		
		protected function onSWFComplete(event:Event):void
		{
			_loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,onSWFComplete);
			
			var lc:LoaderInfo=event.target as LoaderInfo;
			if(lc.content is AVM1Movie)
			{
				_AVM1MC=_loader;
			}
			else
			{
				_data=lc.content as MovieClip;
			}
				
			
			dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETED));

		}
		
		override public function get load():Loader
		{
			return this._loader;
		}
	}
}