package crawlingtosea.game
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import crawlingtosea.algorithms.astar.Grid;
	import crawlingtosea.core.c2debug;
	import crawlingtosea.debug.c2config;
	
	
	/** 
	 * 测试类没有公开
	 * @class Game
	 * @author mengtianwxs
	 * @createTime 2013-12-18
	 */
	
	internal class Game extends Sprite
	{
		private var _player:Sprite=null;
		private var _cellSize:int=20;
		private var _grid:Grid;
	    private var _index:int;
		private var _path:Array;
		
		use namespace c2debug;
		
		public function Game(rootClass:Object,stage:Stage,frameRate:int=30)
		{
			super();
			c2config.init(rootClass,stage,frameRate);
			
			
		}

		c2debug function get cellSize():int
		{
			return _cellSize;
		}

		c2debug function set cellSize(value:int):void
		{
			_cellSize = value;
		}

		c2debug function get player():Sprite
		{
			return _player;
		}

		c2debug function set player(value:Sprite):void
		{
			_player = value;
		}

	}
}