package crawlingtosea.algorithms
{
	
	public class Counter
	{
		private static var i:int=0;
		private var _step:int=0;
	
		
		public function Counter(step:int=0)
		{
			this._step=step;
		}
		
		public function count(value:int=0):void
		{
			value++;
		}
		
		/**
		 * @example step=3,loop 0,1,2
		 * @param step
		 * @return 
		 * 
		 */		
		public function loop(step:int=0):int
		{
			this._step=_step||step;
			i=(i+(_step-1))%_step;
			return _step-(i+1);	
		}
		
		public function reverser(step:int=0):int
		{
			this._step=_step||step;
			i=i=(i+(_step-1))%_step;
			return i;
		}
		
		public static function Loop(step:int=12):int
		{
			i=(i+(step-1))%step;
		   return step-(i+1);	
		}
		
		public static function Reverser(step:int=12):int
		{
			i=i=(i+(step-1))%step;
			return i;
		}
		
	}
}