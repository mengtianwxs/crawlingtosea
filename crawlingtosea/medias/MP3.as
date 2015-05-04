package crawlingtosea.medias
{
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import crawlingtosea.core.c2debug;

	internal class MP3
	{
		private var _tag:uint=0;
		private var _mp3s:Array;
		private var _mp3:MP3;
		private var _sound:Sound;
		
		use namespace c2debug;
		
		/**
		 * 测试类暂时不对外公开 
		 * @param path
		 * 
		 */		
		
		public function MP3(path:String)
		{
			//this._mp3s=_mp3s?mp3s:[];
			
			/*var i:uint=mp3s.length;
			//倒序加载
			do
			{
			  init(_mp3s[i]);
			  i--;
			}while(i==0)
			*/
			init(path);	
		}
		
		c2debug function init(path:String):void
		{
			_sound=new Sound(new URLRequest(path));
			
		}
		
		c2debug function get mp3s():Array
		{
			return _mp3s;
		}

		c2debug function set mp3s(value:Array):void
		{
			_mp3s = value;
		}

		c2debug function get tag():uint
		{
			return _tag;
		}

		c2debug function set tag(value:uint):void
		{
			_tag = value;
			
		}
		
		

		c2debug function playMP3sByTag():void
		{
			
		}
		
		
		
		
	}
}