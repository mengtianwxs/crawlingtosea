package crawlingtosea.loaders
{
	import flash.events.EventDispatcher;
	
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.LoaderEvent;
	
	/**
	 * 混合加载。可以加载的类型有JPG,PNG,GIF,XML,SWF。
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	[Event(name="ai_multicompleted", type="crawlingtosea.events.LoaderEvent")]
	public class _Test extends EventDispatcher
	{
		private var _strArray:Array=null;
		private var _tag:uint=0;
		
		private var _myObj:Array;
		
		
		
		private var _xmlArray:Array;
		private var _bmpArray:Array;
		private var _swfArray:Array;
		private var _xmlTag:uint=0;
		private var _xmlTag1:uint=0;
		private var _bmpTag:uint=0;
		private var _bmpTag1:uint=0;
		
		private var _dataLen:int=0;
		private var _dataArray:Array;
		
		public function _Test(data:*=null)
		{
			//初始化数组
			_strArray=[];
			_xmlArray=[];
			_bmpArray=[];
			_swfArray=[];
			_myObj=[];
			
			_dataArray=[];
			
			
			if(data is Array)
			{
				parseArray(data);
			}
			else if(data is String)
			{
				_strArray.push(data);
				parseArray(_strArray);
			}
			else
			{
				throw new ArgumentError(Debug.Error_ArgumentTypeIsWrong);
			}
			
			
		}
		
		
		////////////////////////////////////////////////////////////////
		//getter/setter方法
		////////////////////////////////////////////////////////////////
		
		
		public function get tag():uint
		{
			return _tag;
		}
		
		public function get strArray():Array
		{
			return _strArray;
		}
		
		/**
		 * 解析数组 
		 * @param array
		 * 
		 */		
		protected function parseArray(array:Array=null):void
		{
			_dataLen=array.length;
			
			for each(var i:String in array)
			{
				switch(parseString(i))
				{
					case "xml":
						trace("This is xml");
						loaderXML(i);
						_strArray.push(i);
						break;
					case "jpg":
						trace("This is jpg");
						loaderBMP(i);
						_strArray.push(i);
						break;
					case "png":
						trace("This is png");
						//loaderBMP(i);
						_strArray.push(i);
						break;
					case "gif":
						trace("This is gif");
						//loaderBMP(i);
						_strArray.push(i);
						break;
					case "swf":
						trace("This is swf");
						_strArray.push(i);
						break;
					
					default:
						trace("tag: "+_tag);
						break;
				}
			}
		}
		
		/**
		 * 解析字符串 
		 * @param str
		 * @return 
		 * 
		 */		
		protected function parseString(str:String=null):String
		{
			return str.split(".")[(str.split(".").length-1)].toString();
		}
		
		protected function loaderXML(path:String=null):void
		{
			_xmlArray.push(new LoaderXML(path));
			_xmlArray[_xmlArray.length-1].addEventListener(LoaderEvent.COMPLETED,onXMLComplete,false,0,true);
			
		}
		
		protected function onXMLComplete(event:LoaderEvent):void
		{	
			_dataArray.push(_xmlArray.length);
			
			_xmlArray[_xmlTag].removeEventListener(LoaderEvent.COMPLETED,onXMLComplete);
			_myObj.push(_xmlArray[_xmlTag].data);
			
			
			if(judgeTag(_tag))
			{
				sendEvent();
			}
			
		}
		
		protected function loaderBMP(path:String=null):void
		{
			
			_tag++;
			_bmpArray.push(new LoaderBitmap(path));
			_bmpArray[_bmpArray.length-1].addEventListener(LoaderEvent.COMPLETED,onBMPComplete,false,0,true);
			
		}
		
		protected function onBMPComplete(event:LoaderEvent):void
		{
			
			_dataArray.push(_bmpArray.length);
			
			_bmpArray[_bmpTag].removeEventListener(LoaderEvent.COMPLETED,onBMPComplete);
			
			_myObj.push(_bmpArray[_bmpTag].data);
			
			
			if(judgeTag(_tag))
			{
				sendEvent();
			}
		}
		
		/**
		 * 通过标签得到对象 
		 * @param tag
		 * @return 
		 * 
		 */		
		public function getObjByTag(tag:uint=0):Object
		{
			return _myObj[tag];
		}
		
		/**
		 * 判断标签的长度是否和数组的长度一样 
		 * @param tag
		 * @return 
		 * 
		 */		
		protected function judgeTag(tag:uint=0):Boolean
		{
			return (tag==_dataArray.length)?true:false;
		}
		
		/**
		 * 如果标签的长度等于数组的长度则发送事件 
		 * 
		 */		
		protected function sendEvent():void
		{
			
			dispatchEvent(new LoaderEvent(LoaderEvent.AI_MULTICOMPLETED));
		}
		
	}
}

