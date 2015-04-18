package crawlingtosea.algorithms.astar
{
	
	/**
	 * A星寻路
	 * @author mengtianwxs
	 * @createTime 2013-3-9
	 */	
	
	public class Astar
	{
		//启发函数的几种方式
		public static const Diagonal:String="diagonal";
		public static const Manhattan:String="manhattan";
		public static const Euclidian:String="euclidian";
		
		//启发函数
		private var _heuristic:Function;
		
		//直线花费的距离
		private var _straightCost:Number=1.0;
		//对角线花费的距离
		private var _diagCost:Number=Math.SQRT2;
		//待查路径
		private var _open:Array;
		//已查路径
		private var _closed:Array;
		//网格
		private var _grid:Grid;
		//结束节点
		private var _endNode:Node;
		//开始节点
		private var _startNode:Node;
		//包含最终路径的数组
		private var _path:Array;
		
		public function AStar(heuristic:String="diagonal"):void
		{
			
			switch(heuristic)
			{
				case "diagonal":
					_heuristic=diagonal;
					//trace("1");
					break;
				case "manhattan":
					_heuristic=manhattan;
					//trace("2")
					break;
				case "euclidian":
					_heuristic=euclidian;
					//trace("3")
				default:
					
					break;
				
			}
		}
		
		/////////////////////////////////////////////////////////
		//findpath
		/////////////////////////////////////////////////////////
		
		public function findPath(grid:Grid):Boolean
		{
			_grid=grid;
			_open=new Array();
			_closed=new Array();
			
			_startNode=_grid.startNode;
			_endNode=_grid.endNode;
			
			_startNode.g=0;
			_startNode.h=_heuristic(_startNode);
			_startNode.f=_startNode.g+_startNode.h;
			
			return search();
		}
		
		//寻路核心算法
		private function search():Boolean
		{
			// TODO Auto Generated method stub
			var node:Node=_startNode;
			while(node!=_endNode)
			{
				//规范扫描范围
				var startX:int=Math.max(0,node.x-1);
				var endX:int=Math.min(_grid.numClos-1,node.x+1);
				var startY:int=Math.max(0,node.y-1);
				var endY:int=Math.min(_grid.numRows-1,node.y+1);
				
				for(var i:int=startX;i<=endX;i++)
				{
					for(var j:int=startY;j<=endY;j++)
					{
						var test:Node=_grid.getNode(i,j);
						
						//如果测试节点等于当前节点或测试节点不能通过则直接跳过检测
						if(test==node||!test.walkable||!_grid.getNode(node.x,test.y).walkable||!_grid.getNode(test.x,node.y).walkable) continue;
						
						//花费的代价默认为直线代价
						var cost:Number=_straightCost;
						
						//如果测试的节点不在横向或纵向则花费的代价为对角代价
						if(!((node.x==test.x)||(node.y==test.y)))
						{
							cost=_diagCost;
						}
						
						//计算出测试节点的代价
						var g:Number=node.g+cost;
						var h:Number=_heuristic(test);
						var f:Number=g+h;
						
						//检查节点是否在已经列表或待查列表中
						if(isOpen(test)||isClosed(test))
						{
							if(test.f>f)
							{
								test.f=f;
								test.h=h;
								test.g=g;
								test.parent=node;
							}
							
						}
						else
						{
							test.f=f;
							test.h=h;
							test.g=g;
							test.parent=node;
							_open.push(test);
						}
						
					}
				}
				_closed.push(node);
				if(_open.length==0)
				{
					return false;
				}
				_open.sortOn("f",Array.NUMERIC);
				node=_open.shift()as Node;
			}
			buildPath();
			return true;
		}
		
		
		////////////////////////////////////////////////////////
		//private method
		////////////////////////////////////////////////////////
		
		private function buildPath():void
		{
			_path=new Array();
			var node:Node=_endNode;
			_path.push(node);
			while(node!=_startNode)
			{
				node=node.parent;
				_path.unshift(node);
			}
		}
		
		
		
		private function isOpen(node:Node):Boolean
		{
			for(var i:uint=0;i<_open.length;i++)
			{
				if(_open[i]==node)
				{
					return true;
				}
			}
			
			return false;
		}
		
		private function isClosed(node:Node):Boolean
		{
			for(var i:uint=0;i<_closed.length;i++)
			{
				if(_closed[i]==node)
				{
					return true;
				}
			}
			return false;
		}
		
		
		
		////////////////////////////////////////////////////////
		//getter/setter
		////////////////////////////////////////////////////////
		public function get path():Array
		{
			return _path;
		}
		
		public function get visited():Array
		{
			return _closed.concat(_open);
		}
		
		
		
		////////////////////////////////////////////////////////
		//启发函数
		////////////////////////////////////////////////////////
		
		private function euclidian(node:Node):Number
		{
			var dx:Number=node.x-_endNode.x;
			var dy:Number=node.y-_endNode.y;
			return Math.sqrt(dx*dx+dy*dy)*_straightCost;
		}
		
		
		
		private function manhattan(node:Node):Number
		{
			return Math.abs(node.x-_endNode.x)*_straightCost+
				Math.abs(node.y-_endNode.y)*_straightCost;
		}
		
		private function diagonal(node:Node):Number
		{
			var dx:Number=Math.abs(node.x-_endNode.x);
			var dy:Number=Math.abs(node.y-_endNode.y);
			var dmax:Number=Math.max(dx,dy);
			var dmin:Number=Math.min(dx,dy);
			return _diagCost*dmin+_straightCost*(dmax-dmin);
		}
	}
}

