package crawlingtosea.algorithms.astar
{
	
	/**
	 * A星中的网格
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class Grid
	{
		/**
		 *列，行,开始节点，结束节点 
		 */
		
		private var _numClos:uint;
		private var _numRows:uint;
		private var _startNode:Node;
		private var _endNode:Node;
		private var _nodes:Array;
		
		
		
		public function Grid(numClos:int,numRows:int)
		{
			this._numClos=numClos;
			this._numRows=numRows;
			_nodes=new Array();
			//构建网格区域
			for(var i:int=0;i<_numClos;i++)
			{
				_nodes[i]=new Array();
				for(var j:int=0;j<_numRows;j++)
				{
					//在每个网格中放入一个节点
					_nodes[i][j]=new Node(i,j); 
				}
			}
			
		}
		
		////////////////////////////////////////////////////////
		//public method
		////////////////////////////////////////////////////////
		
		public function getNode(x:int,y:int):Node
		{
			return _nodes[x][y] as Node;
		}
		
		
		public function setEndNode(x:int,y:int):void
		{
			_endNode=_nodes[x][y] as Node;
		}
		
		/**
		 * 设置开始节点
		 * @param x
		 * @param y
		 * 
		 */	
		
		public function setStartNode(x:int,y:int):void
		{
			_startNode=_nodes[x][y] as Node;
		}
		
		
		
		public function setWalkable(x:int,y:int,value:Boolean):void
		{
			_nodes[x][y].walkable=value;
		}
		
		////////////////////////////////////////////////////////
		//getter/setter
		////////////////////////////////////////////////////////
		
		public function get startNode():Node
		{
			return _startNode;
		}
		
		
		public function get endNode():Node
		{
			return _endNode;
		}
		
		public function get numRows():uint
		{
			return _numRows;
		}
		
		
		public function get numClos():uint
		{
			return _numClos;
		}
	}
}

