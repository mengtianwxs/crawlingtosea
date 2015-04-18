package crawlingtosea.game
{
	import flash.display.Sprite;
	import flash.display.Stage;
	
	import crawlingtosea.algorithms.astar.Grid;
	import crawlingtosea.debug.Config;
	
	
	/**
	 * @class Game
	 * @author mengtianwxs
	 * @createTime 2013-12-18
	 */
	
	public class Game extends Sprite
	{
		private var _player:Sprite=null;
		private var _cellSize:int=20;
		private var _grid:Grid;
	    private var _index:int;
		private var _path:Array;
		public function Game(rootClass:Object,stage:Stage,frameRate:int=30)
		{
			super();
			Config.init(rootClass,stage,frameRate);
			
			
		}

		public function get cellSize():int
		{
			return _cellSize;
		}

		public function set cellSize(value:int):void
		{
			_cellSize = value;
		}

		public function get player():Sprite
		{
			return _player;
		}

		public function set player(value:Sprite):void
		{
			_player = value;
		}

	}
}