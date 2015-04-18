package crawlingtosea.events
{
	import flash.events.Event;
	
	/**
	 * 
	 * @author mengtianwxs
	 * @createTime 2013-6-12
	 */
	
	public class TickEvent extends Event
	{
		
		public static const TICK:String="tick";
		public var counter:int;
		
		public function TickEvent(type:String,counter:int)
		{
			super(type);
			this.counter=counter;
		}
		public override function clone():Event
		{
			return new TickEvent(type,counter);
		}
		public override function toString():String
		{
			return formatToString("TickEvent","type","bubbles","cancelable","eventPhase");
		}
	}
}