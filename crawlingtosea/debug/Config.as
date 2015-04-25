package crawlingtosea.debug
{
	import flash.display.FrameLabel;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.ContextMenuEvent;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.system.System;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.utils.getQualifiedClassName;
	
	/**
	 * 配置舞台，可以定义一系列参数在RegisterAndInitStage方法中。
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class Config
	{
		
		////////////////////////////////////////////////////////////////
		//自定义公有常量
		////////////////////////////////////////////////////////////////
		
		/**
		 * 舞台对方方式  
		 */		
		public static const StageAlign_TOP:String="top";
		public static const StageAlign_BOTTOM:String="bottom";
		public static const StageAlign_LEFT:String="left";
		public static const StageAlign_RIGHT:String="right";
		public static const StageAlign_TopLeft:String="topLeft";
		public static const StageAlign_TopRight:String="topRight";
		public static const StageAlign_BottomLeft:String="bottomLeft";
		public static const StageAlign_BottomRight:String="bottomRight";
		
		/**
		 * 文本对齐方式  
		 */		
		public static const TextFieldAutoSize_NONE:String="none";
		public static const TextFieldAutoSize_LEFT:String="left";
		public static const TextFieldAutoSize_RIGHT:String="right";
		public static const TextFieldAutoSize_CENTER:String="center";
		
		public static const TextFormatAlign_CENTER:String="center";
		public static const TextFormatAlign_JUSTIFY:String="justify";
		public static const TextFormatAlign_LEFT:String="left";
		public static const TextFormatAlign_RIGHT:String="right";
		
		/**
		 *  文本类型被设置为dynamic时,文本可以通过actionscript被更改但用户不能.
		 */		
		public static const TextFieldType_DYNAMIC:String="dynamic";
		
		/**
		 *  文本类型被设置为input时,允许文本框接收用户的输入.
		 */		
		public static const TextFieldType_INPUT:String="input";
		
		/**
		 * 舞台缩放 
		 */		
		public static const StageScaleMode_ExactFit:String="exactFit";
		public static const StageScaleMode_ShowAll:String="showAll";
		public static const StageScaleMode_NoBorder:String="noBorder";
		public static const StageScaleMode_NoScale:String="noScale";
		
		/**
		 * 渐变填充方式  
		 */		
		public static const GradientType_LINEAR:String="linear";
		public static const GradientType_RADIAL:String="radial";
		
		/**
		 * URLLoaderDataFormat 
		 */		
		public static const URLLoaderDataFormat_BINARY:String="binary";
		public static const URLLoaderDataFormat_TEXT:String="text";
		public static const URLLoaderDataFormat_VARIABLES:String="variables";
		
		
		
		/**
		 * ASDoc
		 * CapsStyle 类是可指定在绘制线条中使用的端点样式的常量值枚举。 
		 * 常量可用作 flash.display.Graphics.lineStyle() 方法的 caps 参数中的值。 
		 */		
		/**
		 * 用于在 flash.display.Graphics.lineStyle() 方法的 caps 参数中指定没有端点。 
		 */		
		public static const CapsStyle_None:String="none";
		/**
		 * 用于在 flash.display.Graphics.lineStyle() 方法的 caps 参数中指定圆头端点。 
		 */		
		public static const CapsStyle_Round:String="round";
		/**
		 * 用于在 flash.display.Graphics.lineStyle() 方法的 caps 参数中指定方头端点。 
		 */		
		public static const CapsStyle_Square:String="square";
		
		/**
		 * ASDoc
		 * JointStyle 类是指定要在绘制线条中使用的联接点样式的常量值枚举。 
		 * 提供的这些常量用作 flash.display.Graphics.lineStyle() 方法的 joints 参数中的值。 
		 * 此方法支持三种类型的连接：尖角、圆角和斜角 。
		 */		
		/**
		 * 在 flash.display.Graphics.lineStyle() 方法的 joints 参数中指定斜角连接。 
		 */		
		public static const JointStyle_Bevel:String="bevel";
		
		/**
		 * 在 flash.display.Graphics.lineStyle() 方法的 joints 参数中指定尖角连接。 
		 */		
		public static const JointStyle_Miter:String="miter";
		/**
		 * 在 flash.display.Graphics.lineStyle() 方法的 joints 参数中指定圆角连接。 
		 */		
		public static const JointStyle_Round:String="round";
		
		
		////////////////////////////////////////////////////////////////
		//自定义变量
		////////////////////////////////////////////////////////////////
		
		/**
		 * 舞台参数 
		 */		
		private static var _stage:Stage;
		private static var _rootClass:Object;
		private static var _isSignature:Boolean=false;
		private static var _m:ContextMenu;
		private static var _url:String=null;
		private static var _target:String=null;
		
		private static var _stageAlign:String=null;
		private static var _stageScaleMode:String=null;
		private static var _DebugMode:Boolean=true;
		
		private static var _halfSW:Number;
		private static var _halfSH:Number;
		
		private static var _SW:Number;
		private static var _SH:Number;
		
		private static var _methods:Array;
		
		public static var isInit:Boolean=false;
	
		public function Config()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.debug::Config")
			{
				throw new Error(Debug.Error_CannotInstance);
			}
		}
		
		////////////////////////////////////////////////////////////////
		//getter/setter方法
		////////////////////////////////////////////////////////////////
		
		internal static function get methods():Array
		{
			return _methods;
		}

		public static function setAlign(value:String):void
		{
			
			_stage.align=value;
		}

		public static function setScaleMode(value:String):void
		{
			
			_stage.scaleMode=value;
		}

		public static function get sh():Number
		{
			return _stage.stageHeight;
		}

		public static function get sw():Number
		{
			return _stage.stageWidth;
		}
		
		public static function get random_ysh():Number
		{
			return Math.random()*sh;
		}
		
		public static function get random_xsw():Number
		{
			return Math.random()*sw;
		}

		public static function get HalfSH():Number
		{
			return _halfSH;
		}

		public static function get HalfSW():Number
		{
			return _halfSW;
		}

		/**
		 * Config类注册舞台核心方法。如果需要实现config类功能则必须使用此方法注册舞台。   
		 * @param rootClass
		 * @param stage
		 * @param frameRate
		 * @param isNoScale
		 * @param isUseDecimal
		 * @param isUseCodePage
		 * 
		 */	
		
		public static function init(rootClass:Object=null,stage:Stage=null,frameRate:uint=30,isNoScale:Boolean=true,isUseDecimal:Boolean=false,isUseCodePage:Boolean=true):Boolean
		{
			//隐藏stage中的菜单
			
		   
			_rootClass=rootClass;
			_stage=stage;
			_stage.align=Config.StageAlign_TopLeft;
			_stage.frameRate=frameRate;
			_stage.scaleMode=isNoScale?(Config.StageScaleMode_NoScale):(Config.StageScaleMode_ShowAll);
			
			//当设置为false是默认值,Flash Player 使用 Unicode 解释外部文本文件。
			System.useCodePage=isUseCodePage;
			
			if(isUseDecimal)
			{
				_halfSH=_stage.stageHeight/2.00;
				_halfSW=_stage.stageWidth/2.00;
			}
			else
			{
				_halfSH=_stage.stageHeight>>1;
				_halfSW=_stage.stageWidth>>1; 
			}			
			
			return isInit=stage?true:false;
		}
		
		public static function get Container():Sprite{
			
			if(Config)
			{
				var s:Sprite=new Sprite();
				Config.stage.addChild(s);
				return s;
			}
			return null;
		}
		
		/**
		 * 注册舞台 
		 * @param obj
		 * 
		 */		
		public static function RegisterStage(stage:Stage=null):void
		{
		   _stage=stage;
		}
		
		/**
		 * 分析舞台信息 
		 * @param value
		 * 
		 */	
		
		public static function ParseAndTraceStage(value:Boolean=true):void
		{
		   if(value)
		   {
			   var arr:Array=(_rootClass as MovieClip).scenes;
			   trace("/////////////////////////舞台信息/////////////////////////");
			   trace("// 舞台上凡 "+arr.length+ " 个场景");
			   for(var i:uint=0;i<arr.length;++i)
			   {
				   trace("// 第 "+i+" 个场景的场景名是 "+arr[i].name+" 帧数是 "+arr[i].numFrames);
				   if(arr[i].labels.length>=1)
				   {
					   for each(var f:FrameLabel in arr[i].labels)
					   {
						   trace("// 第 "+i+" 个场景上第 "+f.frame+" 帧的帧标签名是 "+f.name);
					   }
				   }
				   else
				   {
					   trace("// 是场景中没有帧标签。");
				   }
			   }
			   
			   trace("/////////////////////////舞台信息/////////////////////////");
		   }
		}
		
		/**
		 * 隐藏舞台菜单 
		 * @param value
		 * 
		 */		
		public static function HideDefaultMenu(value:Boolean=false):void
		{
			_stage.showDefaultContextMenu=value;
		}
		
		/**
		 * 返回舞台对象
		 * @return 舞台
		 * 
		 */		
		public static function get stage():Stage
		{
			return _stage;
		}
		
		/**
		 * 隐藏菜单和签名实现
		 * @param caption
		 * @param separatorBefore
		 * @param enabled
		 * @param visible
		 * @param target
		 * 
		 */		
		public static function HideMenuAndSignature(caption:String=null,separatorBefore:Boolean=true,enabled:Boolean=true,visible:Boolean=true,target:String="_blank"):void
		{
			_m=new ContextMenu();
			_m.hideBuiltInItems();
			_rootClass.contextMenu=_m;
			
			var cmi:ContextMenuItem=new ContextMenuItem(caption,separatorBefore,enabled,visible);
			_m.customItems.push(cmi);
			cmi.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,onMenuItemSelect);
			_target=target;
		}
		
		/**
		 * 设置签名菜单的URL地址 
		 * @param url
		 * 
		 */		
		public static function AddSignatureURL(url:String=null):void
		{
			_url=url;
		}
		
		/**
		 * 将要跳转的url地址 
		 * @param event
		 * 
		 */		
		protected static function onMenuItemSelect(event:ContextMenuEvent):void
		{
			// TODO Auto-generated method stub
			
			if(_url==null)
			{
				throw new ArgumentError(Debug.Error_URLIsNull);
			}
			else
			{
				navigateToURL(new URLRequest(_url),_target);
			}
			
		}
		
		
		
		/*public static function Activate(methods:Array):void
		{
			
		}*/
	}
}