package crawlingtosea.methods
{
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	
	import crawlingtosea.events.TickEvent;
	
	/**
	 * 时间基。当构造函数等于0时，启用进入帧事件。当非0时，则启用时间间隔函数。
	 * @author mengtianwxs
	 * @createTime 2013-6-9
	 */
	
	[Event(name="tick", type="crawlingtosea.events.TickEvent")]
	public class Tick extends EventDispatcher
	{
		
		public static const TICK_ENTERFRAME:int=0;
		public static const TICK_SETINTERVAL:int=1;
		private var _id:int=0;
		private var _counter:int=0;
		private var _s:Shape=new Shape();
		private var _t:int=0;
		private var _tickFrame:Number=0;
		
		public function Tick(tickMethod:int=TICK_ENTERFRAME,tickFrame:int=1000)
		{
			switch(tickMethod)
			{
				case 0:
					_s.addEventListener(Event.ENTER_FRAME,onClipEvent);
					break;
				case 1:
					_id=setInterval(closure,tickFrame);
				break;
			}
			
			this._t=tickMethod;
			_tickFrame=tickFrame;
				
		}
		
		protected function onClipEvent(event:Event):void
		{
			// TODO Auto-generated method stub
			dispatchEvent(new TickEvent(TickEvent.TICK,_counter++));
		}
		
		private function closure():void
		{
			// TODO Auto Generated method stub
			dispatchEvent(new TickEvent(TickEvent.TICK,_counter++));
			
		}
		
		public function stop():Boolean
		{
			if(_t==0)
			{
				_s.removeEventListener(Event.ENTER_FRAME,onClipEvent);
			}
			else
			{
				clearInterval(_id);
			}
			return true;
		}
		
		public function restart():void
		{
		   if(stop())
		   {
			   if(_t==0)
			   {
				   _s.addEventListener(Event.ENTER_FRAME,onClipEvent);
			   }
			   else
			   {
				   _id=setInterval(closure,_tickFrame);
			   }
			   
			   
		   }
		}
		
	}
}