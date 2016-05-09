package crawlingtosea.container
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import crawlingtosea.debug.c2config;
	import crawlingtosea.debug.Debug;
	
	/**
	 * 管理容器
	 * @author mengtianwxs
	 * @createTime 2013-3-15
	 */	
	
	public class Container
	{
		
		private var _container:DisplayObjectContainer;
		
		public function Container(parentContainer:DisplayObjectContainer=null)
		{
			_container=parentContainer;
		}
		
		/**
		 * 注册容器的方法 
		 * @param container
		 * 
		 */		
		public function register(container:DisplayObjectContainer=null):void
		{
			_container=container;
		}
		
		
		/**
		 * 把显示对象依次添加到容器中 
		 * @param displayObjects
		 * 
		 */		
		
		public function push(displayObjects:*=null):void
		{
			if(_container!=null)
			{
				
				if(displayObjects is Array)
				{
					for each(var a:DisplayObject in displayObjects)
					{
						_container.addChild(a);
					}
				}
				
				else if(displayObjects is DisplayObject)
				{
					_container.addChild(displayObjects);
				}
				else
				{
					throw new Error(Debug.Error_IsNotDisplayObject);
				}
			}
		}
		/**
		 * 删除容器中的显示对象 
		 * @param displayObject
		 * 
		 */		
		public function pop(displayObjects:*=null):void
		{
			if((_container!=null)&&(_container.numChildren!=0))
			{
				if(displayObjects is Array)
				{
					for each(var o:DisplayObject in displayObjects)
					{
						_container.removeChild(o);
						
					}
				}
				else if(displayObjects is DisplayObject)
				{
					_container.removeChild(displayObjects);
				}
				else
				{
					throw new Error(Debug.Error_IsNotDisplayObject);
				}
			}
		}
		
		/**
		 * 移除所有孩子 
		 * @param upToDown
		 * 当upToDown为true时,使用自上而下的方法删除容器中的孩子;
		 * 当upToDown为false时,使用自下而上的方法删除容器中的孩子。
		 * 推荐使用默认方法。
		 * 
		 */		
		public function clear(upToDown:Boolean=false):void
		{
			if(!upToDown)
			{
				while(_container.numChildren>0)
				{
					_container.removeChildAt(0);
				}
			}
			else
			{
				while(_container.numChildren>0)
				{
					_container.removeChildAt(_container.numChildren-1);
				}
			}
		}
		
		/**
		 * 置顶方法 
		 * @param obj
		 * 
		 */		
		public function pushItToTop(obj:DisplayObject=null):void
		{

			_container.setChildIndex(obj,(_container.numChildren-1));

		}
		
		/**
		 * 置底方法  
		 * @param obj
		 * 
		 */			
		public function pushItToDown(obj:DisplayObject=null):void
		{
			
				_container.setChildIndex(obj,0);
			
		}
		
		/**
		 * 在容器中，把显示对象A放到显示对象B的前面
		 * @param aobj
		 * @param bobj
		 * 
		 */		
		public function insertAFrontB(aobj:DisplayObject=null,bobj:DisplayObject=null):void
		{
			_container.setChildIndex(aobj,_container.getChildIndex(bobj));
		}
		
		/**
		 * 在容器中，把显示对象A放到显示对象B的后面
		 * @param aobj
		 * @param bobj
		 * 
		 */		
		public function insertABehindB(aobj:DisplayObject=null,bobj:DisplayObject=null):void
		{
			_container.setChildIndex(aobj,_container.getChildIndex(bobj)-1);
		}
		
		/**
		 * 测试容器是否包含另一个显示对象
		 * @param obj
		 * @return 
		 * 
		 */			
		public function contains(obj:DisplayObject):Boolean
		{
			return _container.contains(obj);
		}
		
		/**
		 * 容器的深度值 
		 * @return 
		 * 
		 */		
		public function get depth():int
		{
			return _container.numChildren-1;
		}
		
		public function get numChildren():int
		{
			return _container.numChildren;
		}
		
	}
}