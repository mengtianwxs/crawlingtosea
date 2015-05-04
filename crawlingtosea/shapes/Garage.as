package crawlingtosea.shapes
{
	import crawlingtosea.core.c2shape;
	
	
	/**
	 * 车库
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class Garage extends c2shape
	{
		/**
		 * 颜色 
		 */		
		private var _colors:Number=0;
		
		
		public function Garage()
		{
			super();
			drawGarage();
		}
		/**
		 * 绘制车库 
		 * 
		 */		
		private function drawGarage():void
		{
			graphics.clear();
			graphics.lineStyle(_colors);
			graphics.lineTo(100,0);
			graphics.lineTo(100,200);
			graphics.lineTo(260,200);
			graphics.lineTo(260,0);
			graphics.lineTo(360,0);
			graphics.endFill();
		}
		
		/**
		 * 设置颜色 
		 * @param value
		 * 
		 */		
		public function set colors(value:Number):void
		{
			_colors = value;
			drawGarage();
		}
	}
}