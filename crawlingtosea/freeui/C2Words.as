package crawlingtosea.freeui
{
	import flash.display.Loader;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.getDefinitionByName;
	
	import crawlingtosea.core.c2ui;
	import crawlingtosea.debug.c2config;
	import crawlingtosea.debug.Debug;
	import crawlingtosea.events.UIEvent;
	
	
	/**
	 * 更换字体。
	 * @author mengtianwxs
	 * @createTime 2013-3-19
	 */	
	
	[Event(name="font_loaded", type="crawlingtosea.events.UIEvent")]
	
	public class c2words extends c2ui
	{
		private var _swfFontPath:String=null;
		private var _fontName:String =null;
		
		private var _fontSize:int=0;
		private var _fontColors:uint=0;
		private var _letterSpacing:int=0;
		
		private var loaders:Loader;
		private var _texts:String =null;
		
		private var _myFontName:String=null;
		private var _tf:TextField=null;
		
		/**
		 * 通过加载其他swf中的字体，来实现改变字体的效果。 
		 * @param fontName
		 * @param swfFontPath
		 * @param fontSize
		 * @param colors
		 * @param letterSpacing
		 * 
		 */		
		public function c2words(fontName:String=null,swfFontPath:String=null,fontSize:int=14,colors:uint=0,letterSpacing:int=0)
		{
			super();
			_tf=new TextField();
			addChild(_tf);
			
			this._swfFontPath=swfFontPath;
			this._fontName=fontName;
			
			
			this._fontColors=colors;
			this._fontSize=fontSize;
			this._letterSpacing=letterSpacing;
			
			if((swfFontPath!=null)&&(fontName!=null))
			{
				loadFontInSWF();
			}
			
		}
		
		////////////////////////////////////////////
		//setter/getter方法
		////////////////////////////////////////////
		
		
		public function get letterSpacing():int
		{
			return _letterSpacing;
		}
		
		public function get fontColors():uint
		{
			return _fontColors;
		}
		
		public function get fontSize():int
		{
			return _fontSize;
		}
		
		public function get fontName():String
		{
			return _fontName;
		}
		
		public function get swfFontPath():String
		{
			return _swfFontPath;
		}
		
		public function set swfFontPath(value:String):void
		{
			_swfFontPath = value;
			loadFontInSWF();
		}
		
		public function set fontName(value:String):void
		{
			_fontName = value;
		}
		
		public function set label(value:String):void
		{
			_texts = value;
			_tf.text=_texts;
			
		}

		public function set fontSize(value:int):void
		{
			_fontSize = value;
			formatTextField()
		}

		/**
		 * 把字体加载到SWF中 
		 * 
		 */		
		protected function loadFontInSWF():void
		{
			if(_fontName!=null)
			{
				var lc:LoaderContext = new LoaderContext();
				//把内容加载至相同的应用域
				lc.applicationDomain = ApplicationDomain.currentDomain;
				loaders = new Loader();
				loaders.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
				
				try
				{
					loaders.load(new URLRequest(_swfFontPath),lc);
				}
				catch(e:IOError)
				{
					throw new IOError(Debug.Error_URLIsWrong);
				}
			}
			else
			{
				throw new Error(Debug.Error_FontNameIsNull);
			}
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */		
		protected function onComplete(event:Event):void
		{
			loaders.contentLoaderInfo.removeEventListener(Event.COMPLETE,onComplete);
			loaders.unloadAndStop();
			
			var fontClass:Class=getDefinitionByName(_fontName) as Class;
			Font.registerFont(fontClass);
			
			var font:Font=new fontClass() as Font;
			_myFontName=font.fontName;
			formatTextField();
			dispatchEvent(new UIEvent(UIEvent.FONT_LOADED));	
		}
		
		/**
		 * 如果字体已经加载完成，则用此方法格式化文本。 
		 * 
		 */		
		protected function formatTextField():void
		{
			var format:TextFormat=new TextFormat();
			format.font=_myFontName;
			format.size=_fontSize;
			format.color=_fontColors;
			format.letterSpacing=_letterSpacing;
			_tf.embedFonts=true;
			_tf.selectable=false;
			_tf.autoSize=c2config.TextFieldAutoSize_LEFT;
			_tf.defaultTextFormat=format;
			
		}
		
		/**
		 * 用没有配置好的来复制配置好的加载参数
		 * @param words
		 * <br/>
		 * 
		 * 下面的示例演示了如何进行配置
		 * @example
		 * <listing version="3">
		 * import crawlingtosea.debug.Config;
		 import crawlingtosea.container.Container;
		 import crawlingtosea.freeui.C2Words;
		 import crawlingtosea.events.UIEvent;
		 
		 Config.RegisterAndInitStage(this,stage);
		 Config.HideDefaultMenu();
		 Config.ParseAndTraceStage();
		 
		 var c:Container = new Container(this);
		 var w:C2Words = new C2Words("HK","FONTS.swf",100,0xff0000,10);
		 var f:C2Words=new C2Words();
		 w.addEventListener(UIEvent.Font_LOADED,onFont);
		 f.addEventListener(UIEvent.Font_LOADED,onFonts);
		 c.push([w,f]);
		 function onFont(e:UIEvent):void
		 {
		 
		 w.label = "测试";
		 
		 trace(w.fontColors,w.fontSize,w.letterSpacing);
		 trace(w.swfFontPath,w.fontName);
		 w.configurateArray([f]);
		 }
		 function onFonts(e:UIEvent):void
		 {
		 
		 f.label = "海之枨";
		 f.move(100,100);
		 }
		 * </listing>
		 * @see #configurateArray()
		 */		
		public function configurate(words:c2words=null):void
		{
			this._swfFontPath=words.swfFontPath;
			this._fontName=words.fontName;
			this._fontColors=words.fontColors;
			this._fontSize=words.fontSize;
			this._letterSpacing=words.letterSpacing;
			this.loadFontInSWF();
			
		}
		
		/**
		 * 
		 * 用已经配置好的来配置没有配置的好的加载参数
		 * 加载有延迟
		 * @param wordsArr
		 * 
		 */		
		
		public function configurateArray(wordsArr:Array=null):void
		{
			for each(var g:c2words in wordsArr)
			{
				g._fontName=this.fontName;
				g._swfFontPath=this.swfFontPath;
				g._fontColors=this.fontColors;
				g._fontSize=this.fontSize;
				g._letterSpacing=this.letterSpacing;
				g.loadFontInSWF();
			}
		}
	}
}

