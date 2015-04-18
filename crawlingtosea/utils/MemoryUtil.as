package crawlingtosea.utils
{
	import flash.net.LocalConnection;
	import flash.sampler.getSize;
	import flash.system.System;
	import flash.utils.getQualifiedClassName;
	
	import crawlingtosea.debug.Debug;
	
	/**
	 * 内存检测工具。
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class MemoryUtil
	{
		public function MemoryUtil()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.utils::MemoryUtil")
			{
				throw new ArgumentError(Debug.Error_CannotInstance);
			}
		}
		
		/**
		 * ASDoc 返回指定对象在与 Flash Player 9.0.115.0 或更高的调试版一起使用时在内存中的大小
		 * @param obj
		 * @return 
		 * 
		 */		
		public static function  UsedMemory(obj:*):Number
		{
			return getSize(obj);
		}
		
		/**
		 * ASDoc Adobe® Flash® Player 当前所用内存的数量（以字节为单位）。 
		 * @return 
		 * 
		 */		
		public static function totalMemory():uint
		{
			return System.totalMemory;
		}
		/**
		 * 系统垃圾回收方法 
		 * ASDoc强制执行垃圾回收进程。
		 * 
		 */		
		public static function GC():void
		{
			System.gc();
		}
		/**
		 * FPBug垃圾回收方法 
		 * 
		 */		
		public static function BugGC():void
		{
			try
			{
				new LocalConnection().connect("foo");
				new LocalConnection().connect("foo");
			}
			catch(e:Error)
			{
				
			}
		}
	}
}