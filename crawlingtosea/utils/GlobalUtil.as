package crawlingtosea.utils
{
	import flash.utils.getQualifiedClassName;
	
	import crawlingtosea.debug.Debug;
	
	/**
	 * 全局工具。
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	public class GlobalUtil
	{
		public function GlobalUtil()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.utils::GlobalUtil")
			{
				throw new ArgumentError(Debug.Error_CannotInstance);
			}
		}
		
		/**
		 * ASDoc
		 * 将字符串转换为整数。 如果参数中指定的字符串不能转换为数字，则此函数返回 NaN。
		 * 以 0x 开头的字符串被解释为十六进制数字。 与 ActionScript 的早期版本不同，以 0 开头的整数不会被解释为八进制数字。 
		 * 必须指定 8 的基数才能解释为八进制数字。 有效整数前面的空白和 0 以及后面的非数字字符将被忽略。 
		 * @param str
		 * @param radix
		 * @return 
		 * 
		 */		
		
		public static function ParseInt(str:String,radix:uint):Number
		{
			return parseInt(str,radix);
		}
		
		/**
		 * ASDoc
		 * 将字符串转换为浮点数。 此函数读取或分析 并返回字符串中的数字，直到此函数遇到不是初始数字一部分的字符。 
		 * 如果字符串不是以可以分析的数字开头，parseFloat() 将返回 NaN。
		 * 有效整数前面的空白将被忽略，有效整数后面的非数字字符也将被忽略。 
		 * @param str
		 * @return 
		 * 
		 */		
		public static function ParseFloat(str:String):Number
		{
			return parseFloat(str);
		}
	}
}