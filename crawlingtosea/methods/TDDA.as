package crawlingtosea.methods
{
	import crawlingtosea.core.C2NS_DEBUG;
	
	/**
	 * @class TDDA
	 * @author mengtianwxs
	 * @createTime 2013-11-30
	 */
	use namespace C2NS_DEBUG;
	public function TDDA(data:Array,a:int,b:int):Array
	{
		
		return 	DoubleDimensionalArray.C2NS_DEBUG::to(data,a,b);
	}
	
}