package crawlingtosea.methods
{
	
	/**
	 * 数据类型检查
	 * @author mengtianwxs
	 * @createTime 2013-8-22
	 */
	
	
	public function CheckoutType(data:*):*
	{
		if(data is String)
			return String;
		if(data is XML)
			return XML;
		if(data is Array)
			return Array;
		return null;
		
	}
}