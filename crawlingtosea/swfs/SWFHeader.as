package crawlingtosea.swfs
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import crawlingtosea.swfs.core.ISWFD;
	import crawlingtosea.swfs.core.Tag;

	
	/**
	 *
	 * mengtianwxs
	 *2014-2-4
	 */
	public class SWFHeader implements ISWFD
	{
		private var _signature:String="";
		private var _version:int=0;
		private var _fileLength:int=0;
		private var _frameSize:RECT=null;
		private var _frameRate:int=0;
		private var _frameCount:int=0;
		
		/**
		 *Signature byte: 
		 * “F” indicated uncompressed; 
		 *“C” indicates compressed (SWF 6 or later only) using ZLib compression. 
		 * “Z” indicates compressed using LZMA compression. 
		 */		
		
		public static var FWS:String="465753";
		
		
		
		
		public function SWFHeader(data:ByteArray)
		{
			if(data==null)
			{
				
			}
			  parseSWFData(data);
		}
		
		public function get type():String
		{
			return null;
		}
		public function set type(vlaue:String):void
		{
			
		}
		
		public function get length():int
		{
			return null;
		}
		
		public function set length(value:int):void
		{
			
		}
		public function get frameCount():int
		{
			return _frameCount;
		}

		public function set frameCount(value:int):void
		{
			_frameCount = value;
		}

		public function get frameRate():int
		{
			return _frameRate;
		}

		public function set frameRate(value:int):void
		{
			_frameRate = value;
		}

		public function get frameSize():RECT
		{
			return _frameSize;
		}

		public function set frameSize(value:RECT):void
		{
			_frameSize = value;
		}

		public function get fileLength():int
		{
			
			return _fileLength;
		}

		public function set fileLength(value:int):void
		{
			_fileLength = value;
		}

		public function get version():int
		{
			return _version;
		}

		public function set version(value:int):void
		{
			_version = value;
		}

		public function get signature():String
		{
			
			return _signature;
		}

		public function set signature(value:String):void
		{
			_signature = value;
		}
		
		
		
		protected function parseSWFData(data:ByteArray):void
		{
			data.position=0;
		     _signature=data.readUTFBytes(3);  
			 data.position=3;
			 _version=data.readByte();
			 data.position=4;
			 data.endian=Endian.LITTLE_ENDIAN;
			 _fileLength=data.readUnsignedInt();
			 data.endian=Endian.BIG_ENDIAN;
			 
			 
			 
		}

	}
}