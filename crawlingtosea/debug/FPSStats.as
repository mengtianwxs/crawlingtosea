package crawlingtosea.debug
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.utils.getTimer;
	import flash.utils.setInterval;
	
	/**
	 * 此类完全借鉴了KP大叔mc中的方法
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class FPSStats
	{
		private var _txt:TextField;
		private var _startTime:int=0;
		private var _frames:int=0;
		private var _fps:int=0;
		private var _stage:Stage;
		
		/**
		 * 构造函数
		 * @param x
		 * @param y
		 * 
		 */		
		
		public function FPSStats(x:Number=10,y:Number=10)
		{
			_stage=Config.stage;
			_txt=new TextField();
			_txt.autoSize=Config.TextFieldAutoSize_LEFT;
			_stage.addChild(_txt);
			
			_stage.addEventListener(Event.ENTER_FRAME,onFrames,false,0,true);
			_stage.addEventListener(Event.REMOVED_FROM_STAGE,onFromStage);
			_startTime=getTimer();
			this.move(x,y);
		}
		
		/**
		 * 开始 
		 * 
		 */		
		public function start():void
		{
			_stage.addEventListener(Event.ENTER_FRAME,onFrames,false,0,true);
		}
		
		/**
		 *  
		 * @param e
		 * 
		 */		
		protected function onFromStage(e:Event):void
		{
			stop();
		}
		
		/**
		 * 停止
		 * 
		 */		
		public function stop():void
		{
			_stage.removeEventListener(Event.ENTER_FRAME,onFrames);
		}
		
		/**
		 * 重绘
		 * 
		 */		
		protected function draw():void
		{
			_txt.text="fps: "+_fps+" f/s";
		}
		
		/**
		 * 
		 * @param e
		 * 
		 */		
		protected function onFrames(e:Event):void
		{
			_frames++;
			var endTime:int=getTimer();
			var diff:int=endTime-_startTime;
			
			if(diff>=1000)
			{
				_fps=Math.round(_frames*1000/diff);
				_startTime=endTime;
				_frames=0;
				draw();
			}
		}
		
		/**
		 * 在输出面板中输出 
		 * 
		 */		
		public function testTrace(interval:Number=1000):void
		{
			setInterval(function():void{trace("fps: "+_fps+" f/s");},interval);
			
		}
		
		/**
		 * 移动位置 
		 * @param x
		 * @param y
		 * 
		 */		
		public function move(x:Number=10,y:Number=10):void
		{
			this._txt.x=x;
			this._txt.y=y;
		}
	}
}

