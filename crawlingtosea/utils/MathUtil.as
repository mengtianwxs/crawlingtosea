package crawlingtosea.utils
{
	import flash.display.DisplayObject;
	import flash.utils.getQualifiedClassName;
	
	import crawlingtosea.debug.Debug;
	
	/**
	 * 数学工具
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	public class MathUtil
	{
		private static const PI:Number= 3.141592653589793;
		
		public function MathUtil()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.utils::MathUtil")
			{
				throw new ArgumentError(Debug.Error_CannotInstance);
			}
		}
		
		/**
		 * 
		 * @method radians2degress 弧度转成角度
		 * @return 
		 * 
		 */		
		public static function radians2degress(radians:Number):Number
		{
			return radians*180/PI;
		}
		
		/**
		 * 
		 * @method degress2radians 角度转成弧度
		 * @return 
		 * 
		 */		
		
		public static function degress2radians(degress:Number):Number
		{
			return degress*PI/180;
		}
		
		
		
		/**
		 * 
		 * @param radians
		 * @return 弧度转成角度值
		 * 
		 */		
		public static function r2d(radians:Number):Number
		{
			return radians*180/PI;
		}
		
		/**
		 * 
		 * @param degress
		 * @return 角度转成弧度值 
		 * 
		 */		
		public static function d2r(degress:Number):Number
		{
			return degress*PI/180;
		}
		
		/**
		 * 
		 * @param num
		 * @return 判断一个有符号32位整数是否为偶数 
		 * 
		 */	
		
		public static function isEven(num:int):Boolean
		{
			return (num&1)==0;
		}
		
		/**
		 * 
		 * @param num
		 * @return 判断一个有符号32位整数是否为奇数 
		 * 
		 */	
		
		public static function isOdd(num:int):Boolean
		{
			return (num&1)!=0;
		}
		
		/**
		 * 
		 * @param a
		 * @param b
		 * @return 两点之间的距离 
		 * 
		 */		
		
		public static function apt2bpt(a:DisplayObject=null,b:DisplayObject=null):Number
		{
			var dx:Number=a.x-b.x;
			var dy:Number=a.y-b.y;
			return Math.sqrt(dx*dx+dy*dy);
		}
		
		/**
		 * 
		 * @param colors
		 * @return 32alpha 
		 * 
		 */		
		public static function getColor32Alpha(colors:uint=0):uint
		{
			return colors>>24;
		}
		
		/**
		 * 
		 * @param colors
		 * @return 32red 
		 * 
		 */		
		
		public static function getColor32Red(colors:uint=0):uint
		{
			return colors>>16&0xff;	
		}
		
		/**
		 * 
		 * @param colors
		 * @return 32green
		 * 
		 */		
		public static function getColor32Green(colors:uint=0):uint
		{
			return colors>>8&0xff;
		}
		
		/**
		 * 
		 * @param colors
		 * @return 32blue
		 * 
		 */		
		public static function getColor32Blue(colors:uint=0):uint
		{
			return colors&0xff;
		}
		
		/**
		 * 
		 * @param colors
		 * @return 24red
		 * 
		 */		
		public static function getColor24Red(colors:uint=0):uint
		{
			return colors>>16;
		}
		
		/**
		 * 
		 * @param colors
		 * @return 24green
		 * 
		 */		
		public static function getColor24Green(colors:uint=0):uint
		{
			return colors>>8&0xff;
		}
		
		/**
		 * 
		 * @param colors
		 * @return 24blue
		 * 
		 */		
		public static function getColor24Blue(colors:uint=0):uint
		{
			return colors&0xff;
		}
		
		/**
		 * 
		 * @param reds
		 * @param greens
		 * @param blues
		 * @return 合成后的颜色
		 * 
		 */		
		
		public static function combine24colors(reds:uint=0,greens:uint=0,blues:uint=0):uint
		{
			return reds<<16 | greens<<8 | blues;
		}
	}
}