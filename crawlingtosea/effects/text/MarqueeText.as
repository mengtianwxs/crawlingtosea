package crawlingtosea.effects.text
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.setInterval;
	
	/**
	 * 跑马灯文字效果
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class MarqueeText
	{
		private var _tf:TextField;
		private var _text:String;
		
		public function MarqueeText(textField:TextField=null)
		{
			_tf=textField;
		}
		
		/**
		 * 设置文本内容 
		 * @param value
		 * 
		 */		
		public function set text(value:String):void
		{
			_text = value;
			_tf.text=_text;
		}

		/**
		 * 包装文本方法 
		 * @param colors
		 * @param size
		 * @param isBold
		 * @param isUnderline
		 * @param isItalic
		 * 
		 */		
		public function packTextField(colors:uint=0,size:int=12,isBold:Boolean=false,isUnderline:Boolean=false,isItalic:Boolean=false):void
		{
			var f:TextFormat=new TextFormat();
			f.color=colors;
			f.size=size;
			f.bold=isBold;
			f.underline=isUnderline;
			f.italic=isItalic;
			_tf.setTextFormat(f);	
		}
		
		/**
		 * 开始跑马灯效果 
		 * @param colors
		 * @param size
		 * @param delay
		 * 
		 */		
		public function startMarquee(colors:uint=0,size:int=12,delay:Number=500):void
		{
			var oldTextField:TextField=_tf;
			var oldLen:int=oldTextField.getLineLength(0);
			var oldText:String=oldTextField.text;
			var i:int=0;
			
			setInterval(update,delay);
			function update():void
			{
				if(i==oldLen)
					i=0;
				var f:TextFormat=new TextFormat();
				f.color=colors;
				f.size=size;
				_tf.selectable=false;
				_tf.replaceText(0,oldLen,oldText);
				_tf.setTextFormat(f,i,i+1);
				i++;
			}
		}
		
		
	}
}