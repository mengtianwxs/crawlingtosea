package crawlingtosea.container
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	
	/**
	 * 
	 * @author mengtianwxs
	 * @createTime 2013-6-9
	 */
	
	public class Frame extends Sprite
	{
		private var _tag:uint;
		private var _name:String;
		private var _nums:uint;
		
		public function Frame()
		{
			super();
		}

		public function get nums():uint
		{
			return this.numChildren;
		}

		override public function get name():String
		{
			return _name;
		}

		override public function set name(value:String):void
		{
			_name = value;
		}

		public function get tag():uint
		{
			return _tag;
		}

		public function set tag(value:uint):void
		{
			_tag = value;
		}

	}
}