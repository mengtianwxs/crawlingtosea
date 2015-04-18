package crawlingtosea.events
{
	import flash.events.Event;
	
	/**
	 * 加载事件
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class LoaderEvent extends Event
	{
		/**
		 * 加载事件类型
		 */		
		public static const COMPLETED:String="completed";
		public static const AI_COMPLETED:String="ai_completed";
		public static const AI_MULTICOMPLETED:String="ai_multicompleted";
		public static const AI_MULTI_MEDIACOMPLETED:String="ai_multicompleted_meidacompleted";
		public static const AI_MULTI_TEXTCOMPLETED:String="ai_multicompleted_textcompleted";
		public static const QUEUELOADER_COMPLETED:String="queueloader_completed";
		public static const LOADERS_COMPLETED:String="loaders_completed";
		
		
		/**
		 * 加载构造函数 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function LoaderEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 *  
		 * @return 事件
		 * 
		 */		
		public override function clone():Event
		{
			return new LoaderEvent(type,bubbles,cancelable);
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public override function toString():String
		{
			return formatToString("LoaderEvent","type","bubbles","cancelable","eventPhase");
		}
	}
}