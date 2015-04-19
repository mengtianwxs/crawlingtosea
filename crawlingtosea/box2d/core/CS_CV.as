package crawlingtosea.box2d.core
{
	import avmplus.getQualifiedClassName;
	
	import crawlingtosea.debug.Debug;
	
	/**
	 *
	 * mengtianwxs
	 *2015-4-9
	 */
	public class CS_CV
	{
		/**
		 * cs_constant_value 
		 */		
		public static const DT:Number=1/30;
		public static const WS:int=30;
		public static const  RadToDeg:Number = 180 / Math.PI;
		
		public function CS_CV()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.box2d.core::CS_CV"){
				throw new Error(Debug.Error_CannotInstance);
			}
		}
	}
}