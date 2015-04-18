package crawlingtosea.methods
{
	import flash.utils.setTimeout;
	
	import crawlingtosea.debug.Debug;
	
	/**
	 *
	 * mengtianwxs
	 *2015-3-25
	 */
	public class Delay
	{
		public var onComplete:Function;
		public var duration:Number=0;
		
		public function Delay( duration:Number=0,complete:Function=null):void
		{
		
			this.onComplete=complete;
			if(complete!=null){
			setTimeout(onComplete,duration);
			}else{
				trace(Debug.Error_FunctionIsNull);
			}
		}
		
		
		public static function to(duration:Number=0,complete:Function=null):Delay{
			return new Delay(duration,complete);
		}
	}
}