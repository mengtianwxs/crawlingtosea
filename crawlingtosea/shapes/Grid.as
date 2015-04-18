package crawlingtosea.shapes
{
	import crawlingtosea.core.C2Shape;
	
	
	/**
	 * 网格
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class Grid extends C2Shape
	{
		
		/**
		 * 绘制网格构造函数 
		 * @param width
		 * @param height
		 * @param size
		 * @param alphas
		 * @param colors
		 * @param offset
		 * 
		 */		
		public function Grid(width:Number,height:Number,size:Number=10,alphas:Number=0.3,colors:uint=0x0,offset:Number=0)
		{
			super();
			
			//设置画笔
			graphics.clear();
			graphics.lineStyle(1,colors,alphas);
			//画竖线
			for(var i:uint=(0+offset);i<=(width-offset);i+=size)
			{
				graphics.moveTo(i,(0+offset));
				graphics.lineTo(i,(height-offset));
			}
			
			//画横线
			for(i=(0+offset);i<=(height-offset);i+=size)
			{
				graphics.moveTo((0+offset),i);
				graphics.lineTo((width-offset),i);
				
			}
			
			graphics.endFill();
		}
	}
}