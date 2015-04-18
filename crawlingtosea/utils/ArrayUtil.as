package crawlingtosea.utils
{
	import flash.utils.getQualifiedClassName;
	
	import crawlingtosea.debug.Debug;
	
	/**
	 * 数组工具。
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	public class ArrayUtil
	{
		private var _arr:Array;
		public function ArrayUtil(arr:Array=null)
		{
			/*if(getQualifiedClassName(this)=="crawlingtosea.utils::ArrayUtil")
			{
				throw new ArgumentError(Debug.Error_CannotInstance);
			}*/
			this._arr=arr;	
		}
		
		/**
		 * 检查数组 
		 * @param array
		 * @return 
		 * 
		 */		
		public static function hasArray(array:Array=null):Boolean
		{
			  return array.length>0?true:false;
		}
		
		/**
		 * #从数组中查找某一元素的索引，如果没有则返回-1 
		 * @param array
		 * @param element
		 * @return 
		 * 
		 */		
		public static function searchArray(array:Array,element:Object):int
		{
			//定义l变量提高运算性能
			var l:int=array.length;
		   for(var i:int=0;i<l;i++)
		   {
			  if(l[i]==element)
			  {
				  return i;
				  break;//加入break语句提高运算性能
			  }
		   }
		   
		   return -1;
		}
		public function clear(arr:Array=null):void{
			this._arr=arr||_arr;
			do{
				_arr.pop();
			}while(_arr.length>0);
			
		}
		
		public function get length():int{
			return _arr.length;
		}
	}
	
}