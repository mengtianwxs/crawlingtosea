package crawlingtosea.swfs
{
	import flash.utils.ByteArray;
	
	
	/**
	 *
	 * mengtianwxs
	 *2014-2-4
	 */
	public class SWF 
	{
		private var _data:ByteArray;
		
		public function SWF(data:ByteArray)
		{
			this._data=data;
		}

		public function get data():ByteArray
		{
			return _data;
		}

		public function set data(value:ByteArray):void
		{
			_data = value;
		}
		
		public function prepare():void
		{
			
		}
		
		public function put():void
		{
			
		}

	}
}