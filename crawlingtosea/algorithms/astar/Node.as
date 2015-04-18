package crawlingtosea.algorithms.astar
{
	
	/**
	 * A星中的节点
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class Node
	{
		
		public var x:int;
		public var y:int;
		//f=g+h
		public var f:Number;
		public var g:Number;
		public var h:Number;
		
		public var walkable:Boolean=true;
		public var parent:Node;
		
		public function Node(x:int,y:int)
		{
			this.x=x;
			this.y=y;
		}
	}
}


