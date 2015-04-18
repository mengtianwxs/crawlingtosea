package crawlingtosea.medias
{
	import flash.media.Sound;
	import flash.net.URLRequest;

	public class MP3
	{
		private var _tag:uint=0;
		private var _mp3s:Array;
		private var _mp3:MP3;
		private var _sound:Sound;
		
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
		
		protected function init(path:String):void
		{
			_sound=new Sound(new URLRequest(path));
			
		}
		
		public function get mp3s():Array
		{
			return _mp3s;
		}

		public function set mp3s(value:Array):void
		{
			_mp3s = value;
		}

		public function get tag():uint
		{
			return _tag;
		}

		public function set tag(value:uint):void
		{
			_tag = value;
			
		}
		
		

		public function playMP3sByTag():void
		{
			
		}
		
		
		
		
	}
}