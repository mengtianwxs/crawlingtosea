package crawlingtosea.methods
{
	
	
	/**
	 * 
	 * @author mengtianwxs
	 * @createTime 2013-8-22
	 */
	
	
	public function GetSuffix(str:String):String
	{
		return str.split(".")[(str.split(".").length-1)].toString(); 	
	}
}