package crawlingtosea.events
{
	import flash.events.Event;
	
	
	/**
	 * 
	 * @author mengtianwxs
	 * @createTime 2013-8-22
	 */
	
	public class QueueEvent extends Event
	{
		public static const QUEUE_COMPLETED:String="queue_completed";
		public static const QUEUE_RUNNING:String="queue_running";
		
		
		public function QueueEvent(type:String)
		{
			super(type);
			
		}
		
		public override function clone():Event
		{
			return new QueueEvent(type);
		}
		
		public override function toString():String
		{
			return formatToString("QueueEvent","type","bubbles","cancelable","eventPhase");
		}
	}
}