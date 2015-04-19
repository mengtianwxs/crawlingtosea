package crawlingtosea.debug
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * 输出调试信息
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class Debug
	{
		
		public static const Error_CannotInstance:String="『海之枨云』§* 是类不可实例化 *§";
		public static const Error_URLIsNull:String="『海之枨云』§* URL不能为空 *§";
		public static const Error_URLIsWrong:String="『海之枨云』§* URL路径可能存在错误 *§";
		public static const Error_FontNameIsNull:String="『海之枨云』§* FONTNAME不能为空 *§";
		public static const Error_IsNotDisplayObject:String="『海之枨云』§* 不是显示对象 *§";
		public static const Error_ArgumentTypeIsWrong:String="『海之枨云』§* 参数类型不匹配 *§";
		public static const Error_ArgumentIsNull:String="『海之枨云』§* 参数不能为空 *§";
		public static const Error_XMLFormatIsWrong:String="『海之枨云』§* 可能XML格式不正确 *§";
		public static const Error_TypeIsWrong:String="『海之枨云』§* 数据格式不正确 *§";
		public static const Error_IOIsWrong:String="『海之枨云』§* 引用数据路径出现错误 *§";
		public static const Error_LoaderIsNull:String="『海之枨云』§* loader对象不能为空 *§";
		public static const Error_FunctionIsNull:String="『海之枨云』§* 函数对象不能为空 *§";
		public static const Error_DebugConfigIsClosed:String="『海之枨云』§* 没有对config类进行初始化操作 *§";;
		
		public function Debug()
		{
			if(getQualifiedClassName(this)=="crawlingtosea.debug::Debug")
			{
				throw new Error(Debug.Error_CannotInstance);
			}
		}
	}
}