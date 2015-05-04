package crawlingtosea.swfs
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	import crawlingtosea.core.c2debug;
	import crawlingtosea.swfs.core.ISWFD;
	import crawlingtosea.swfs.core.Tag;

	
	/**
	 *
	 * mengtianwxs
	 *2014-2-4
	 */
	internal class SWFHeader implements ISWFD
	{
		private var _signature:String="";
		private var _version:int=0;
		private var _fileLength:int=0;
		private var _frameSize:RECT=null;
		private var _frameRate:int=0;
		private var _frameCount:int=0;
		
		use namespace c2debug;

		/**
		 *Signature byte: 
		 * “F” indicated uncompressed; 
		 *“C” indicates compressed (SWF 6 or later only) using ZLib compression. 
		 * “Z” indicates compressed using LZMA compression. 
		 */		
		
		internal static var FWS:String="465753";
		
		
		
		public function SWFHeader(data:ByteArray)
		{
			if(data==null)
			{
				
			}
			  parseSWFData(data);
		}
		
		c2debug function get type():String
		{
			return null;
		}
		c2debug function set type(vlaue:String):void
		{
			
		}
		
		c2debug function get length():int
		{
			return null;
		}
		
		c2debug function set length(value:int):void
		{
			
		}
		c2debug function get frameCount():int
		{
			return _frameCount;
		}

		c2debug function set frameCount(value:int):void
		{
			_frameCount = value;
		}

		c2debug function get frameRate():int
		{
			return _frameRate;
		}

		c2debug function set frameRate(value:int):void
		{
			_frameRate = value;
		}

		c2debug function get frameSize():RECT
		{
			return _frameSize;
		}

		c2debug function set frameSize(value:RECT):void
		{
			_frameSize = value;
		}

		c2debug function get fileLength():int
		{
			
			return _fileLength;
		}

		c2debug function set fileLength(value:int):void
		{
			_fileLength = value;
		}

		c2debug function get version():int
		{
			return _version;
		}

		c2debug function set version(value:int):void
		{
			_version = value;
		}

		c2debug function get signature():String
		{
			
			return _signature;
		}

		c2debug function set signature(value:String):void
		{
			_signature = value;
		}
		
		
		
		c2debug function parseSWFData(data:ByteArray):void
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