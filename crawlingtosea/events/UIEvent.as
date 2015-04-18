package crawlingtosea.events
{
	import flash.events.Event;
	
	/**
	 * UI事件
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class UIEvent extends Event
	{
		public static const FONT_LOADED:String="font_loaded";	
		
		/**
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * 
		 */		
		public function UIEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public override function clone():Event
		{
			return new UIEvent(type,bubbles,cancelable);
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */		
		public override function toString():String
		{
			return formatToString("UIEvent","type","bubbles","cancelable","eventPhase");
		}
	}
}