package crawlingtosea.core
{
	import flash.display.Loader;
	import flash.events.EventDispatcher;
	
	/**
	 * 加载公共继承类
	 * @author mengtianwxs
	 * @createTime 2013-3-22
	 */	
	
	[Event(name="completed", type="crawlingtosea.events.LoaderEvent")]
	
	public class C2Loader extends EventDispatcher
	{
		
		
		public var _loader:Loader=new Loader();
		public var path:String=null;
		
		public function C2Loader(path:String)
		{
		    this.path=path;	
		}
		

		public function get data():Object
		{
			return this;
		}
		public function start():void
		{
			
		}
		public function get load():Loader
		{
			return this._loader;
		}
		
		
	}
}