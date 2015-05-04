package crawlingtosea.core
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	
	
	/**
	 * 形状绘制公共继承类
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class c2shape extends Shape
	{
		public function c2shape()
		{
			super();
		}
		
		/**
		 * 移动方法 
		 * @param xpos
		 * @param ypos
		 * 
		 */		
		public function move(xpos:Number,ypos:Number):void
		{
			x=xpos;
			y=ypos;
		}
		
		/**
		 * 注册父类容器方法 
		 * @param parent
		 * 
		 */				
		public function register(parent:DisplayObjectContainer=null):void
		{
			if(parent!=null)
			{
				parent.addChild(this);
			}
		}
	}
}