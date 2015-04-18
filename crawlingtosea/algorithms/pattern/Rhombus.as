package crawlingtosea.algorithms.pattern
{
	import flash.text.TextField;
	
	import crawlingtosea.core.C2Pattern;
	import crawlingtosea.debug.Config;
	
	/**
	 * 打印菱形图案算法
	 * @author mengtianwxs
	 * @createTime 2013-4-1
	 */	
	
	public class Rhombus extends C2Pattern
	{
		private var _distance:uint=0;
		private var _txt:TextField;
		private var _pattern:String="*";
		
		
		
		public function Rhombus(dis:uint=30,pattern:String="*")
		{
			this._distance=dis;
			this._pattern=pattern;
			_txt=new TextField();
			_txt.autoSize=Config.TextFieldAutoSize_LEFT;
			_txt.selectable=false;
			addChild(_txt);
			drawRhombus();
		}
		
		
		////////////////////////////////////////////////////////////////
		//getter/setter方法
		////////////////////////////////////////////////////////////////
		
		public function get pattern():String
		{
			return _pattern;
		}

		public function set pattern(value:String):void
		{
			_pattern = value;
			/**清空文本内容*/
			_txt.text='';
			drawRhombus();
		}

		public function get distance():uint
		{
			return _distance;
		}

		public function set distance(value:uint):void
		{
			_distance = value;
			drawRhombus();
		}

		private function drawRhombus():void
		{
			var i:uint;
			var j:uint;
			var n:uint=4;
			
			/** 打印前四行*/
			for(i=1;i<=n;i++)
			{
				for(j=1;j<=_distance;j++)
					_txt.appendText(' ');
				for(j=1;j<=8-2*i;j++)
					_txt.appendText(' ');
				for(j=1;j<=2*i-1;j++)
					_txt.appendText(_pattern);
				_txt.appendText("\n");
			}
			/** 打印后三行*/
			for(i=1;i<=n-1;i++)
			{
				for(j=1;j<=_distance;j++)
					_txt.appendText(' ');
				for(j=1;j<=7-2*i;j++)
					_txt.appendText(_pattern);
				_txt.appendText("\n");
			}
			
		}
	}
}