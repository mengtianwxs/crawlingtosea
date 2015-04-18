package crawlingtosea.algorithms
{
	public class BinarySearch
	{
		public function BinarySearch()
		{
			
		}
		/**
		 * 二分查找。返回查询键在数组中的索引。 
		 * @param key
		 * @param a
		 * @return 
		 * 
		 */		
		public function rank(key:int,a:Array):int
		{
			var lo:int=0;
			var hi:int=a.length-1;
			while(lo<=hi)
			{
				var mid:int=lo+(hi-lo)/2;
				if(key<a[mid])
					hi=mid-1;
				else if(key>a[mid])
					hi=mid+1;
				else 
					return mid;
				lo++;
			}
			return -1;
			
		}
		
	}
}
