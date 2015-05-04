package crawlingtosea.methods
{
	import crawlingtosea.core.c2debug;
	
	/**
	 * @class TDDA
	 * @author mengtianwxs
	 * @createTime 2013-11-30
	 */
	use namespace c2debug;
	public function TDDA(data:Array,a:int,b:int):Array
	{
		
		return 	DoubleDimensionalArray.c2debug::to(data,a,b);
	}
	
}