package crawlingtosea.events
{
	import flash.events.Event;

	public class ProgressEvent extends Event
	{
		
		public static const Progress:String="progress";
		public static const Progress_StopCount:String="progress_stopcount";
		public static const Progress_Start:String="progress_start";
		
		public function ProgressEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type,bubbles,cancelable);
		}
		public override function clone():Event{
			return new ProgressEvent(type,bubbles,cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("ProgressEvent","type","bubbles","cancelable","eventPhase");
		}
	}
}