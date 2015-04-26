package crawlingtosea.box2d
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import crawlingtosea.box2d.core.CSb2CV;
	import crawlingtosea.debug.Config;
		

	public class CSb2World
	{
		
		private var s:Shape=null;
		private var world:b2World=null;;
		private var debugSprite:Sprite=null;
		private var isRegister:Boolean=false;
		private var isRender:Boolean=false;
		private var _isRenderSkin:Boolean=false;
		private var _isForce:Boolean=false;
		private var _vec_body:Vector.<b2Body>=new Vector.<b2Body>();
		private var _vec_force:Vector.<b2Vec2>=new Vector.<b2Vec2>();
		private var _vec_bodyname:Vector.<String>=new Vector.<String>();
		
		public function CSb2World(_x:Number=0,_y:Number=10)
		{
			/*if(getQualifiedClassName(this)=="crawlingtosea.box2d::CWorld"){
				throw new Error(Debug.Error_CannotInstance);
			}*/
		var gravity:b2Vec2=new b2Vec2(_x,_y);
		world=new b2World(gravity,true);	
		}
		
		public  function GetWorld():b2World{
			if(world!=null){
			return world;}
			return null;
			
		}
		
		public function pushForceToBody(force:b2Vec2,body:String=""):void{
			if(body!=""){
				var b:b2Body=getBodyByName(body);
				if(b!=null){
					_isForce=true;
					_vec_body.push(b);
					_vec_bodyname.push(body);
					_vec_force.push(force);
						
				}
			}
		}
		
		protected function getNumByName(s:String=""):int{
			trace(_vec_bodyname.indexOf(s));
			return _vec_bodyname.indexOf(s);
		}
		 
		
		public function registerAndStartRender(s:Sprite=null,isRenderSkin:Boolean=false):void{
			registerContainer(s);
			startRender(isRenderSkin);
			
		}
		public function registerContainer(s:Sprite=null):void
		{
			if(s==null&&Config.isInit){
			   debugSprite=Config.Container;
			}
			else{
			   debugSprite=s;
			}
			isRegister=debugSprite?true:false;
			
		}
		
		public function startRender(isRenderSkin:Boolean=false):void{
			s=new Shape();
			s.addEventListener(Event.ENTER_FRAME,render);
			_isRenderSkin=isRenderSkin;
			
			var debugRender:Boolean=isRenderSkin?false:true;
			if(isRegister&&debugRender)
			{
			isRender=true;
			var debug:b2DebugDraw=new b2DebugDraw();
			debug.SetAlpha(0.3);
			debug.SetLineThickness(2);
			debug.SetSprite(debugSprite);
			debug.SetDrawScale(30);
			debug.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
			world.SetDebugDraw(debug);
			}
			
			
		}
		
		public function push(b2bodyDef:b2BodyDef):b2Body{
			return world.CreateBody(b2bodyDef);
		}
		
		public function remove(b2body:b2Body):void{
			if(b2body.GetFixtureList()!=null){
				
			b2body.DestroyFixture(b2body.GetFixtureList());
			}

		}
		
		public function destroyWorld():void{
		
			s.removeEventListener(Event.ENTER_FRAME,render);
			s=null;
		
		}
		
		public function getBodyByName(s:String):b2Body{
			for (var b:b2Body = world.GetBodyList(); b; b = b.GetNext())
			{
				if(b.GetUserData().name==s)
				{
					return b;
				}
			}
			return null;
		}
		
		protected function render(event:Event):void
		{
			// TODO Auto-generated method stub
			world.Step(CSb2CV.DT, 10, 10);
			if(isRender){
				world.DrawDebugData();
			}
			
			if(_isRenderSkin){
				for (var b:b2Body = world.GetBodyList(); b; b = b.GetNext())
				{
					if(b.GetUserData())
					{
						b.GetUserData().asset.x = b.GetPosition().x * 30;
						b.GetUserData().asset.y = b.GetPosition().y * 30;
						b.GetUserData().asset.rotation = b.GetAngle() * CSb2CV.RadToDeg;
						b.ResetMassData();
					}
					
					if(_isForce&&_vec_body.length!=0){
						
						for (var i:int=0;i<_vec_body.length-1;i++)
						{
							
							var bd:b2Body=(b2Body)(_vec_body[i]);
							bd.ApplyForce(_vec_force[i],bd.GetPosition());
							
							
						}
						world.ClearForces();
						
				}
					
				}
			}
			
			
			
		}		
		
	}
}
