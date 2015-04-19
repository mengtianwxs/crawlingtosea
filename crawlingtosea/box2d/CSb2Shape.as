package crawlingtosea.box2d
{
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Collision.Shapes.b2Shape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import crawlingtosea.box2d.core.CSb2CV;
	import crawlingtosea.debug.Config;
	import crawlingtosea.debug.Debug;

	public class CSb2Shape extends b2Shape
	{
		protected var world:b2World=null;
		public function CSb2Shape(b2world:b2World)
		{
			world=b2world;
		}
		
		public function GetCircle(posx:Number,posy:Number,radius:int,whatisit:int=0):b2Body{
			
			
			var bddf:b2BodyDef=new b2BodyDef();
			bddf.position.Set(posx/CSb2CV.WS,posy/CSb2CV.WS);
			bddf.type=whatisit;
			
			var shape:b2CircleShape=new b2CircleShape(radius/CSb2CV.WS);		
			
			var b2fd:b2FixtureDef=new b2FixtureDef();
			b2fd.density=5;
			
			b2fd.restitution=.2;
			
			b2fd.shape=shape;
			
			var b2body:b2Body=world.CreateBody(bddf);
			b2body.CreateFixture(b2fd);
			return b2body;
		}
		
		public function GetBox(posx:int, posy:int, w:Number, h:Number,whatisit:int=0):b2Body{
			var bddf:b2BodyDef=new b2BodyDef();
			bddf.position.Set(posx/CSb2CV.WS,posy/CSb2CV.WS);
			bddf.type=whatisit;
			
			var shape:b2PolygonShape=new b2PolygonShape();
			shape.SetAsBox(w/2/CSb2CV.WS,h/2/CSb2CV.WS);
			
			
			var b2fd:b2FixtureDef=new b2FixtureDef();
			b2fd.density=5;
			b2fd.shape=shape;
			
			var b2body:b2Body=world.CreateBody(bddf);
			b2body.CreateFixture(b2fd);
			return b2body;
		}
		
		public function GetAABBWorld(w:int=5):b2Body{
			if(Config.isInit){
			var _w:int=w;
			var _hw:int=_w/2;
			var _sw:int=Config.sw;
			var _sh:int=Config.sh;
			var _hsw:int=Config.HalfSW;
			var _hsh:int=Config.HalfSH;
		
			
			var shapeVec:Vector.<b2PolygonShape>=new Vector.<b2PolygonShape>();
			
			var b2bodydef:b2BodyDef = new b2BodyDef();
			b2bodydef.type = 0;
			
			var b2fixture:b2FixtureDef = new b2FixtureDef();
			b2fixture.density = 1;
			b2fixture.restitution = 0;
			
			var b2body:b2Body = world.CreateBody(b2bodydef);
			
			var vec1:b2Vec2 = new b2Vec2(_hsw/CSb2CV.WS,_hw/CSb2CV.WS);
			var shape1:b2PolygonShape =b2PolygonShape.AsOrientedBox(_sw/2/CSb2CV.WS,_w/2/CSb2CV.WS,vec1);
			
			shapeVec.push(shape1);
			
			var vec2:b2Vec2=new b2Vec2(_hw/CSb2CV.WS,_hsh/CSb2CV.WS);
			var shape2:b2PolygonShape= b2PolygonShape.AsOrientedBox(_w/2/CSb2CV.WS,_sh/2/CSb2CV.WS,vec2);
			shapeVec.push(shape2);
			
			var vec3:b2Vec2=new b2Vec2((_sw-_hw)/CSb2CV.WS,_hsh/CSb2CV.WS);
			var shape3:b2PolygonShape=b2PolygonShape.AsOrientedBox(_w/2/CSb2CV.WS,_sh/2/CSb2CV.WS,vec3);
			shapeVec.push(shape3);
			
			var vec4:b2Vec2=new b2Vec2(_hsw/CSb2CV.WS,(_sh-_hw)/CSb2CV.WS);
			var shape4:b2PolygonShape=b2PolygonShape.AsOrientedBox(_sw/2/CSb2CV.WS,_w/2/CSb2CV.WS,vec4);
			shapeVec.push(shape4);
			
			for(var i:int=0;i<=(shapeVec.length-1);i++){
				b2fixture.shape=shapeVec[i];
				b2body.CreateFixture(b2fixture);
			}
			return b2body;}
			else{
				throw new Error(Debug.Error_DebugConfigIsClosed);
				return null;
			}
		}
	}
}