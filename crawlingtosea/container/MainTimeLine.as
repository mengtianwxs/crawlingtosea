package crawlingtosea.container
{
	import flash.display.Sprite;
	
	import crawlingtosea.events.TickEvent;
	import crawlingtosea.methods.Tick;
	
	/**
	 * 时间轴序列。
	 * @author mengtianwxs
	 * @createTime 2013-3-20
	 */	
	
	public class MainTimeLine extends Sprite
	{
		private var _frames:Vector.<Frame>;
		private var _totalFrame:int;
		private var _tick:int;
		public function MainTimeLine()
		{
			
		}
		
		protected function init():void{
			
		}
		
		public function add(value:Frame):void
		{
			//if
		}
		
		public function play():void
		{
			
			var tick:Tick=new Tick(_tick);
			tick.addEventListener(TickEvent.TICK,onTick);
		}
		
		protected function onTick(event:TickEvent):void
		{
			// TODO Auto-generated method stub
		     trace("this is tick"+event.counter);
		}
		
	}
}