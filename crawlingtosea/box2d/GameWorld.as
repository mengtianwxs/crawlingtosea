package crawlingtosea.box2d
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2DebugDraw;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;

	/**
	 * ...
	 * @author mengtianwxs
	 */
	public class GameWorld extends Sprite 
	{
		private const worldScale:Number = 30;
		private var world:b2World;
		private var isDebugDraw:Boolean=false;
		private var isRenderSkin:Boolean=false;

		private var radToDeg:Number=180 / Math.PI;
		private const dt:Number=1/30;
		
		public function GameWorld(isRender:Boolean=true,isDebug:Boolean=false) 
		{
			world = new b2World(new b2Vec2(0, 10), true);
			if (isRender) {
				addEventListener(Event.ENTER_FRAME, render);
			}
			if(isDebug){
				var debugSprite:Sprite=new Sprite();
				addChild(debugSprite);
				
				var debug:b2DebugDraw=new b2DebugDraw();
				debug.SetAlpha(0.3);
				debug.SetLineThickness(2);
				debug.SetSprite(debugSprite);
				debug.SetDrawScale(30);
				debug.SetFlags(b2DebugDraw.e_shapeBit|b2DebugDraw.e_jointBit);
				world.SetDebugDraw(debug);
				isDebugDraw=isDebug;
			}
		}
		
		private function render(e:Event):void 
		{
			
			
			world.Step(dt, 10, 10);
			//world.ClearForces();
			if(isDebugDraw){
				world.DrawDebugData();
			}
			
			if(isRenderSkin){
			for (var b:b2Body = world.GetBodyList(); b; b = b.GetNext())
			{
				if(b.GetUserData())
				{
					b.GetUserData().asset.x = b.GetPosition().x * 30;
					b.GetUserData().asset.y = b.GetPosition().y * 30;
					b.GetUserData().asset.rotation = b.GetAngle() * radToDeg;
					b.ResetMassData();
				}
			}
			}
		
			
		}
		
		public function createAABBWorld(w:int=15):b2Body{
			var _w:int=w;
			var _hw:int=_w/2;
			var _sw:int=this.stage.stageWidth;
			var _sh:int=this.stage.stageHeight;
			var _hsw:int=this.stage.stageWidth/2;
			var _hsh:int=this.stage.stageHeight/2;
			
			/*var b1:b2Body=createBoxShape(_hsw,_hw,_sw,_w);
			var b2:b2Body=createBoxShape(_hw,_hsh,_w,_sh);
			var b3:b2Body=createBoxShape(_sw-_hw, _hsh,_w,_sh);
			var b4:b2Body=createBoxShape(_hsw,_sh-_hw,_sw,_w);*/
			
		var shapeVec:Vector.<b2PolygonShape>=new Vector.<b2PolygonShape>();

			var b2bodydef:b2BodyDef = new b2BodyDef();
			b2bodydef.type = 0;
			
			var b2fixture:b2FixtureDef = new b2FixtureDef();
			b2fixture.density = 1;
			b2fixture.restitution = 0;
			
			var b2body:b2Body = world.CreateBody(b2bodydef);
			
			var vec1:b2Vec2 = new b2Vec2(_hsw/worldScale,_hw/worldScale);
			var shape1:b2PolygonShape =b2PolygonShape.AsOrientedBox(_sw/2/worldScale,_w/2/worldScale,vec1);
							
			shapeVec.push(shape1);
			
			var vec2:b2Vec2=new b2Vec2(_hw/worldScale,_hsh/worldScale);
			var shape2:b2PolygonShape= b2PolygonShape.AsOrientedBox(_w/2/worldScale,_sh/2/worldScale,vec2);
			shapeVec.push(shape2);
			
			var vec3:b2Vec2=new b2Vec2((_sw-_hw)/worldScale,_hsh/worldScale);
			var shape3:b2PolygonShape=b2PolygonShape.AsOrientedBox(_w/2/worldScale,_sh/2/worldScale,vec3);
			shapeVec.push(shape3);
			
			var vec4:b2Vec2=new b2Vec2(_hsw/worldScale,(_sh-_hw)/worldScale);
			var shape4:b2PolygonShape=b2PolygonShape.AsOrientedBox(_sw/2/worldScale,_w/2/worldScale,vec4);
			shapeVec.push(shape4);
			
//			trace(shapeVec.length);
			for(var i:int=0;i<=(shapeVec.length-1);i++){
				b2fixture.shape=shapeVec[i];
				b2body.CreateFixture(b2fixture);
			}
			return b2body;
 		}
		
		public function pushB2ShapeToWorld(b2bodyDef:b2BodyDef):void{
                world.CreateBody(b2bodyDef);
		}
		
		public function createCircleShape(posx:Number,posy:Number,radius:int,whatisit:int=0):b2Body{
			var bddf:b2BodyDef=new b2BodyDef();
			bddf.position.Set(posx/worldScale,posy/worldScale);
			bddf.type=whatisit;
			
		var shape:b2CircleShape=new b2CircleShape(radius/worldScale);
			
			
			var b2fd:b2FixtureDef=new b2FixtureDef();
			b2fd.density=5;
			b2fd.shape=shape;
			
			var b2body:b2Body=world.CreateBody(bddf);
			b2body.CreateFixture(b2fd);
			return b2body;
		}
		
		public function createBoxShape(posx:int, posy:int, w:Number, h:Number,whatisit:int=0):b2Body{
			var bddf:b2BodyDef=new b2BodyDef();
			bddf.position.Set(posx/worldScale,posy/worldScale);
			bddf.type=whatisit;
			
			var shape:b2PolygonShape=new b2PolygonShape();
			shape.SetAsBox(w/2/worldScale,h/2/worldScale);
			
			
			var b2fd:b2FixtureDef=new b2FixtureDef();
			b2fd.density=5;
			b2fd.shape=shape;
			
			var b2body:b2Body=world.CreateBody(bddf);
			b2body.CreateFixture(b2fd);
			return b2body;
		}
		
		
		
		public function createBoxAndBindSkin(posx:int, posy:int, w:Number, h:Number,whatisit:int=0, s:String="", asset:Sprite=null):b2Body
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(posx/ worldScale, posy/ worldScale);
			bodyDef.type = whatisit;
			
			bodyDef.userData = new Object();
			bodyDef.userData.name = s;
			if((asset!=null)&&(asset is Sprite))
			{
			bodyDef.userData.asset = asset;
			addChild(bodyDef.userData.asset);
			isRenderSkin=true;
			}
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(w / 2 / worldScale, h / 2 / worldScale);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = polygonShape;
			
			var b2body:b2Body = world.CreateBody(bodyDef);
			b2body.CreateFixture(fixtureDef);
			return b2body;
		}
		
		public function ressetB2FDByName(s:String="",b2fd:b2FixtureDef=null):void
		{
			
			if((s!="")&&(b2fd!=null))
			{
			for (var b:b2Body = world.GetBodyList(); b; b = b.GetNext())
			{
				
				if(b.GetUserData().name==s){
					
					b.GetFixtureList().SetFriction(b2fd.friction);
					b.GetFixtureList().SetRestitution(b2fd.restitution);
					b.GetFixtureList().SetDensity(b2fd.density);
					b.GetFixtureList().SetSensor(b2fd.isSensor);
					b.GetFixtureList().SetFilterData(b2fd.filter);
					b.ResetMassData();
				}
			}
			}
		}
		
	}
	
}