package crawlingtosea.swfs
{
	import flash.utils.ByteArray;
	
	/**
	 *
	 * mengtianwxs
	 *2014-2-4
	 */
	public class RECT
	{
		private var _Nbits:int=0;
		private var _Xmin:int=0;
		private var _Xmax:int=0;
		private var _Ymin:int=0;
		private var _Ymax:int=0;
		
		public function RECT(data:ByteArray)
		{
			
		}
		
	
		public function get Ymax():int
		{
			return _Ymax;
		}

		public function set Ymax(value:int):void
		{
			_Ymax = value;
		}

		public function get Ymin():int
		{
			return _Ymin;
		}

		public function set Ymin(value:int):void
		{
			_Ymin = value;
		}

		public function get Xmax():int
		{
			return _Xmax;
		}

		public function set Xmax(value:int):void
		{
			_Xmax = value;
		}

		public function get Xmin():int
		{
			return _Xmin;
		}

		public function set Xmin(value:int):void
		{
			_Xmin = value;
		}

		public function get Nbits():int
		{
			return _Nbits;
		}

		public function set Nbits(value:int):void
		{
			_Nbits = value;
		}

	}
}