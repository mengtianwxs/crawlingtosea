package crawlingtosea.freeui
{
	import crawlingtosea.core.c2ui;
	
	/*
	* @declare c2groupmenu
	* @author mengtianwxs
	* @date 2015-5-14
	*/
	
	public class c2groupmenu extends c2ui
	{
		private var _menu:Vector.<String>;
		
		public function c2groupmenu()
		{
			_menu=new Vector.<String>();
		}
		
		public function push(label:String=""):void{
			_menu.push(label);
		}
		
		
	}
}