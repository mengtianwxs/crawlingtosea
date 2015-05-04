package crawlingtosea.methods
{
	import crawlingtosea.core.c2debug;
	
	/**
	 * @class DoubleDimensionalArray
	 * @author mengtianwxs
	 * @createTime 2013-11-29
	 */
	use namespace c2debug;
	
	public class DoubleDimensionalArray
	{
		/*ToDoubleDimensionalArray*/
		c2debug static function to(data:Array=null,a:int=0,b:int=0):Array
		{
			var _data:Array=new Array(a);
			var len:int=data.length;
			var k:int=0;
			if(len==(a*b))
			{
				
				for(var i:int=0;i<a;i++)
				{
					for(var j:int=0;j<b;j++)
					{
						
						
						//trace(data[k],i,j);
						//_data.push(
						//trace(i,j,data[k],_data);
						//k++;
						
						trace(i*a+j%b);
					}
				}
				return _data;
			}
			return null;
			
		}
	}
}