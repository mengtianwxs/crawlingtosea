package crawlingtosea.swfs
{
	import flash.utils.ByteArray;
	
	import crawlingtosea.core.c2debug;
	
	
	/**
	 *
	 * mengtianwxs
	 *2014-2-4
	 */
	internal class SWF 
	{
		private var _data:ByteArray;
		
		public function SWF(data:ByteArray)
		{
			this._data=data;
		}

		c2debug function get data():ByteArray
		{
			return _data;
		}

		c2debug function set data(value:ByteArray):void
		{
			_data = value;
		}
		
		c2debug function prepare():void
		{
			
		}
		
		c2debug function put():void
		{
			
		}
		
		use namespace c2debug;

	}
}