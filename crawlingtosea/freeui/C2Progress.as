package crawlingtosea.freeui
{
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import crawlingtosea.core.c2ui;
	import crawlingtosea.events.ProgressEvent;
	import crawlingtosea.shapes.Square;
	
	
	/**
	 * 四方形加载进度条。
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class c2progress extends c2ui
	{
		
		private var counter:uint=0;
		private var _size:uint=5;
		private var _delay:uint=800;
		
		private var q1:Square;
		private var q2:Square;
		private var q3:Square;
		private var q4:Square;
		private var _bgColors:uint=0;
		private var _colors:uint=0x7dc3ea;
		
		private var timer:Timer;
		
		/**
		 * 进度条构造函数 
		 * @param delay
		 * @param alphas
		 * @param size
		 * @param colors
		 * @param bgColors
		 * 
		 */		
		public function c2progress(delay:uint=800,alphas:Number=0.5,size:uint=5,colors:uint=0x7dc3ea,bgColors:uint=0)
		{
			super();
			_delay=delay;
			alpha=alphas;
			_colors=colors;
			_size=size;
			_bgColors=bgColors;
			initProgress();
		}
		
		/**
		 * 初始化进度条 
		 * 
		 */		
		private function initProgress():void
		{
			// TODO Auto Generated method stub
			q1=new Square(_size,_size);
			q2=new Square(_size,_size);
			q3=new Square(_size,_size);
			q4=new Square(_size,_size);
			
			q1.x = q1.y = 0;
			
			q2.x = (q1.x+_size+3);
			q2.y = 0;
			
			q3.x = (q1.x+_size+3);
			q3.y = (q1.x+_size+3);
			
			q4.x = 0;
			q4.y = (q1.x+_size+3);
			
			this.addChild(q1);
			this.addChild(q2);
			this.addChild(q3);
			this.addChild(q4);
		}
		
		/**
		 * 开始计时 
		 * 
		 */		
		public function startCount():void
		{
			timer=new Timer(_delay,0);
			timer.addEventListener(TimerEvent.TIMER,onTimerEvent);
			timer.start();
		}
		
		/**
		 * 停止计时 
		 * 
		 */		
		public function stopCount():void
		{
			timer.removeEventListener(TimerEvent.TIMER,onTimerEvent);
			timer=null;
			
		}
		
		public function setScale(a:Number):void{
			this.scaleX=a;
			this.scaleY=a;
			//this.scaleZ=a;
		}
		
		/**
		 * 
		 * @param e
		 * 
		 */		
		private function onTimerEvent(e:TimerEvent):void
		{
//			dispatchEvent(new ProgressEvent(ProgressEvent.Progress));
			
			if (counter==5)
			{
				counter = 1;
			}
			
			switch (counter)
			{
				case 1 :
					q1.colors = _colors;
					q2.colors = _bgColors;
					q3.colors = _bgColors;
					q4.colors = _bgColors;
					break;
				case 2 :
					q1.colors = _bgColors;
					q2.colors = _colors;
					q3.colors = _bgColors;
					q4.colors = _bgColors;
					break;
				case 3 :
					q1.colors = _bgColors;
					q2.colors = _bgColors;
					q3.colors = _colors;
					q4.colors = _bgColors;
					break;
				case 4 :
					q1.colors =_bgColors;
					q2.colors =_bgColors;
					q3.colors =_bgColors;
					q4.colors =_colors;
					break;
				default:
					break;
				
			}
			
			counter++;
			
		}
	}
}