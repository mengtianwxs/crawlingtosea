package crawlingtosea.shapes
{
	import crawlingtosea.core.c2shape;
	
	/**
	 * 圆形
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class Circle extends c2shape
	{
		
		/**
		 *  
		 * @param radius
		 * @param colors
		 * 
		 */		
		public function Circle(radius:uint=10,colors:uint=0x0)
		{
			super();
			graphics.clear();
			graphics.beginFill(colors);
			graphics.drawCircle(0,0,radius);
			graphics.endFill();
		}
	}
}