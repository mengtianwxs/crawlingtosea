package crawlingtosea.algorithms.bitmap
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import crawlingtosea.utils.ArrayUtil;
	
	/**
	 * 切割位图算法。
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	public class Slice
	{
		private var _bmpd:BitmapData;
		private var _arr:Array;
		
		public function Slice(bitmapData:BitmapData=null)
		{
			_arr=[];
			this._bmpd=bitmapData;
		}
		
		////////////////////////////////////////////
		//setter/getter方法
		////////////////////////////////////////////
		
		public function get bitmapData():BitmapData
		{
			return _bmpd;
		}

		public function set bitmapData(value:BitmapData):void
		{
			_bmpd = value;
		}
		
		/**
		 * 把得到的位图bitmapData对象存储到bitmapDataArray数组中。 
		 * @return 
		 * 
		 */		
		public function get bitmapDataArray():Array
		{
			if(ArrayUtil.hasArray(_arr))
				
				return _arr;
			return null;
		}

		/**
		 * 开始切割位图 
		 * @param segment
		 * 
		 * 下面的示例演示了如何使用此方法完成游戏中人物的行走
		 * @example
		 * <listing version="3">
		 * 
		 import crawlingtosea.loaders.Loaders;
		 import crawlingtosea.events.LoaderEvent;
		 import crawlingtosea.algorithms.bitmap.Slice;
		 import flash.display.BitmapData;
		 import flash.display.Bitmap;
		 import crawlingtosea.methods.Tick;
		 import crawlingtosea.algorithms.Loop;
		 import crawlingtosea.events.TickEvent;
		 import crawlingtosea.container.Container;
		 import crawlingtosea.debug.Config;
		 
		 var loaders:Loaders=new Loaders("mode.jpg",Loaders.ParseBitmapMethod,completed);
		 
		 var left:Bitmap=new Bitmap();
		 var right:Bitmap=new Bitmap();
		 var back:Bitmap=new Bitmap();
		 var front:Bitmap=new Bitmap();
		 var container:Container=new Container(this);
		 container.push([left,right,back,front]);
		 var tick:Tick=new Tick(Tick.TICK_SETINTERVAL,100);
		 var arr:Array=[];
		 
		 
		 
		 Config.init(this,stage);
		 left.x=Config.random_xsw;
		 left.y=Config.random_ysh;
		 front.x=Config.random_xsw;
		 front.y=Config.random_ysh;
		 back.x=Config.random_xsw;
		 back.y=Config.random_ysh;
		 
		 
		 
		 function completed(e:LoaderEvent):void
		 {
		 //trace("loaded");
		 var bd:BitmapData=loaders.bitmapData;
		 var slice:Slice=new Slice(bd);
		 slice.startSlice(4);
		 tick.addEventListener(TickEvent.TICK,onTick);
		 arr=slice.bitmapDataArray;
		 
		 }
		 
		 function onTick(e:TickEvent)
		 {
		 
		 var l:int=Loop.start(4);
		 right.bitmapData=arr[l];
		 left.bitmapData=arr[l+4];
		 front.bitmapData=arr[l+8];
		 back.bitmapData=arr[l+12];
		 //trace(l);
		 }
		 
		 
		 
		 * </listing>
		 * @see LoaderBitmap#getBitmap()
		 */		
		public function startSlice(segment:int=4):void
		{
			var w:Number=_bmpd.width/segment;
			var h:Number=_bmpd.height/segment;
			
			for (var i:uint=0; i<segment; i++)
			{
				for (var j:uint=0; j<segment; j++)
				{
					var bmd:BitmapData = new BitmapData(w,h);
					bmd.copyPixels(_bmpd,new Rectangle(j*w,i*h,w,h),new Point());
					_arr.push(bmd);
				}
			}
		}
		
		/**
		 * 2014.1.4 用于处理矩形尺寸图形。 
		 * @param xseg
		 * @param yseg
		 * 
		 */		
		public function startAISlice(xseg:int,yseg:int):void
		{
			var w:Number=_bmpd.width/xseg;
			var h:Number=_bmpd.height/yseg;
			for (var i:uint=0; i<yseg; i++)
			{
				for (var j:uint=0; j<xseg; j++)
				{
					var bmd:BitmapData = new BitmapData(w,h);
					bmd.copyPixels(_bmpd,new Rectangle(j*w,i*h,w,h),new Point());
					_arr.push(bmd);
				}
			}
			
		}
		
		
	}
}