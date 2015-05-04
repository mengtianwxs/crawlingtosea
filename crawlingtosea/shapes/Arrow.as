package crawlingtosea.shapes
{
	import flash.display.GradientType;
	import flash.geom.Matrix;
	
	import crawlingtosea.core.c2shape;
	
	
	/**
	 * 箭头
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class Arrow extends c2shape
	{
		
		private static var grad_type:String = GradientType.LINEAR;
		private static var colors:Array = [0x798970,0x3f5d54];
		private static var alphas:Array = [0,1];
		private static var ratios:Array = [0x00,0xFF];
		private static var rotations:Number=Math.PI/4;
		
		private var _xpos_farest:Number=0;
		private var _ypos_farset:Number=0;
		private var _xcontrol1_curve:Number=0;
		private var _ycontrol1_curve:Number=0;
		private var _xdest1_curve:Number=0;
		private var _ydest1_curve:Number=0;
		private var _xangle1:Number=0;
		private var _yangle1:Number=0;
		private var _xangel2:Number=0;
		private var _yangle2:Number=0;
		private var _xangle2_nextpoint:Number=0;
		private var _yangle2_nextpoint:Number=0;
		private var _xcontrol2_curve:Number=0;
		private var _ycontrol2_curve:Number=0;
		private var _xdest2_curve:Number=0;
		private var _ydest2_curve:Number=0;
		private var _isDisplayEdge:uint=0;
		
		/**
		 * 绘制箭头构造方法 
		 * @param xpos_farest
		 * @param ypos_farest
		 * @param xcontrol1_curve
		 * @param ycontrol1_curve
		 * @param xdest1_curve
		 * @param ydest1_curve
		 * @param xangle1
		 * @param yangle1
		 * @param xangle2
		 * @param yangle2
		 * @param xangle2_nextpoint
		 * @param yangle2_nextpoint
		 * @param xcontrol2_curve
		 * @param ycontrol2_curve
		 * @param xdest2_curve
		 * @param ydest2_curve
		 * @param isDisplayEdge
		 * 
		 */		
		public function Arrow(xpos_farest:Number=260,ypos_farest:Number=180,
							  xcontrol1_curve:Number=150,ycontrol1_curve:Number=60,
							  xdest1_curve:Number=235,ydest1_curve:Number=140,
							  xangle1:Number=240,yangle1:Number=130,
							  xangle2:Number=215,yangle2:Number=155,
							  xangle2_nextpoint:Number=220,yangle2_nextpoint:Number=150,
							  xcontrol2_curve:Number=150,ycontrol2_curve:Number=100,
							  xdest2_curve:Number=0,ydest2_curve:Number=60,isDisplayEdge:uint=0)
		{
			super();

			this._xpos_farest=xpos_farest;
			this._ypos_farset=ypos_farest;
			this._xcontrol1_curve=xcontrol1_curve;
			this._ycontrol1_curve=ycontrol1_curve;
			this._xdest1_curve=xdest1_curve;
			this._ydest1_curve=ydest1_curve;
			this._xangle1=xangle1;
			this._yangle1=yangle1;
			this._xangel2=xangle2;
			this._yangle2=yangle2;
			this._xangle2_nextpoint=xangle2_nextpoint;
			this._yangle2_nextpoint=yangle2_nextpoint;
			this._xcontrol2_curve=xcontrol2_curve;
			this._ycontrol2_curve=ycontrol2_curve;
			this._xdest2_curve=xdest2_curve;
			this._ydest2_curve=ydest2_curve;
			
			drawArrow();		
			trace("INFO:2012-03-21");
			trace("makeArrows 参数提示:总共17个参数，参数解释如下");
			trace("xpos_farest:Number,ypos_farest:Number //绘制箭头的顶点位置");
			trace("xcontrol1_curve:Number,ycontrol1_curve:Number //绘制箭头第一条曲线的控制点");
			trace("xdest1_curve:Number,ydest1_curve:Number //绘制箭头第一条曲线的目标点");
			trace("xangle1:Number,yangle1:Number //绘制箭头头部第一个尖角点");
			trace("xangle2:Number,yangle2:Number //绘制箭头头部第二个尖角点");
			trace("xangle2_nextpoint:Number,yangle2_nextpoint:Number // 绘制箭头第二条曲线的起始点位置");
			trace("xcontrol2_curve:Number,ycontrol2_curve:Number //绘制箭头第二条曲线的控制点");
			trace("xdest2_curve:Number,ydest2_curve:Number //绘制箭头第二条曲线的目标点");
			trace("isDisplayEdge:uint=0 //控制参数[0-1] 默认为无描边样式 如果要控制绘制的颜色效果，请到类中修改...");
		}
		
		/**
		 * 绘制箭头方法 
		 * 
		 */		
		private function drawArrow():void
		{
			var matrix:Matrix=new Matrix();
			matrix.createGradientBox(_xpos_farest,_ypos_farset,rotations,0,0);
			
			graphics.clear();
			graphics.lineStyle(1,0,_isDisplayEdge);
			graphics.beginGradientFill(grad_type,colors,alphas,ratios,matrix);
			graphics.curveTo(_xcontrol1_curve,_ycontrol1_curve,_xdest1_curve,_ydest1_curve);
			graphics.lineTo(_xangle1,_yangle1);
			graphics.lineTo(_xpos_farest,_ypos_farset);
			graphics.lineTo(_xangel2,_yangle2);
			graphics.lineTo(_xangle2_nextpoint,_yangle2_nextpoint);
			graphics.curveTo(_xcontrol2_curve,_ycontrol2_curve,_xdest2_curve,_ydest2_curve);
			graphics.lineTo(0,0);
			graphics.endFill();
		}
	}
}