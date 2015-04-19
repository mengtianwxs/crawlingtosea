package crawlingtosea.box2d
{
	import flash.display.Shape;
	
	import avmplus.getQualifiedClassName;
	
	import crawlingtosea.debug.Debug;

	public class CSWorld
	{
		
		private var s:Shape;
		
		public function CSWorld()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.box2d::CWorld"){
				throw new Error(Debug.Error_CannotInstance);
			}
		}
	}
}