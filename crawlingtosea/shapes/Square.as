package crawlingtosea.shapes
{
	import crawlingtosea.core.c2shape;
	
	
	/**
	 * 矩形(包含正方形)
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	public class Square extends c2shape
	{
		
		private var _colors:uint=0x0;
		private var _alphas:Number=1.0;
		private var _width:Number=20;
		private var _height:Number=20;
		private var _isFillColor:Boolean=true;
		private var _thickness:Number=0;
		
		/**
		 *  
		 * @param width
		 * @param height
		 * @param colors
		 * @param alphas
		 * @param isFillColor
		 * @param thickness
		 * 
		 */		
		public function Square(width:Number=20,height:Number=20,colors:uint=0x0,alphas:Number=1.0,isFillColor:Boolean=true,thickness:Number=0)
		{
			super();
			
			this._width=width;
			this._height=height;
			this._colors=colors;
			this._alphas=alphas;
			this._isFillColor=isFillColor;
			this._thickness=thickness;
			drawSquare();
		}
		
		/**
		 * 设置线条粗细程度 
		 * @param value
		 * 
		 */		
		public function set thickness(value:Number):void
		{
			_thickness = value;
			drawSquare();
		}
		
		/**
		 * 矩形绘制方法 
		 * 
		 */		
		private function drawSquare():void
		{
			graphics.clear();
			if(_isFillColor)
			{
				graphics.beginFill(_colors,_alphas);
			}
			else
			{
				graphics.lineStyle(_thickness,_colors,_alphas);
			}
			graphics.drawRect(0, 0, _width, _height);
			graphics.endFill();
		}
		
		/**
		 *  
		 * @return 透明度 
		 * 
		 */		
		public function get alphas():Number
		{
			return _alphas;
		}
		
		/**
		 * 设置透明度 
		 * @param value
		 * 
		 */		
		public function set alphas(value:Number):void
		{
			_alphas = value;
			drawSquare();
		}
		
		/**
		 * 
		 * @return 颜色
		 * 
		 */		
		public function get colors():uint
		{
			return _colors;
		}
		
		/**
		 * 设置颜色 
		 * @param value
		 * 
		 */		
		public function set colors(value:uint):void
		{
			_colors = value;
			drawSquare();
		}
	}
}