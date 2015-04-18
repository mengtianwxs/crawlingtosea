package crawlingtosea.swfs.core
{
	
	/**
	 *
	 * mengtianwxs
	 *2014-2-9
	 */
	public class Tag
	{
		private var _type:String="";
		private var _length:int=0;
	
		
		public function Tag()
		{
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

		public function get length():int
		{
			return _length;
		}

		public function set length(value:int):void
		{
			_length = value;
		}

	}
}