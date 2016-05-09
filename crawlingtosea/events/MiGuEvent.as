package crawlingtosea.events
{
	import flash.events.Event;
	
	
	/*
	* @declare MiGuEvent
	* @author mengtianwxs
	* @date 2015-7-26
	*/
	
	public class MiGuEvent extends Event
	{
		public  var note:String;
		public function MiGuEvent(type:String,note:String="")
		{
			super(type);
			this.note=note;
		}
		/**
		 * 
		 * @return 
		 * 
		 */		
		public override function clone():Event
		{
			return new MiGuEvent(type,note);
		}
		
	}
}