package crawlingtosea.swfs
{
	import flash.utils.ByteArray;
	
	import crawlingtosea.core.c2debug;
	
	/**
	 *
	 * mengtianwxs
	 *2014-2-4
	 */
	internal class RECT
	{
		private var _Nbits:int=0;
		private var _Xmin:int=0;
		private var _Xmax:int=0;
		private var _Ymin:int=0;
		private var _Ymax:int=0;
		
		use namespace c2debug;
		
		public function RECT(data:ByteArray)
		{
			
		}
		
	
		c2debug function get Ymax():int
		{
			return _Ymax;
		}

		c2debug function set Ymax(value:int):void
		{
			_Ymax = value;
		}

		c2debug function get Ymin():int
		{
			return _Ymin;
		}

		c2debug function set Ymin(value:int):void
		{
			_Ymin = value;
		}

		c2debug function get Xmax():int
		{
			return _Xmax;
		}

		c2debug function set Xmax(value:int):void
		{
			_Xmax = value;
		}

		c2debug function get Xmin():int
		{
			return _Xmin;
		}

		c2debug function set Xmin(value:int):void
		{
			_Xmin = value;
		}

		c2debug function get Nbits():int
		{
			return _Nbits;
		}

		c2debug function set Nbits(value:int):void
		{
			_Nbits = value;
		}

	}
}