package crawlingtosea.box2d
{
	import flash.display.Sprite;
	
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	
	import crawlingtosea.box2d.core.CSb2CV;
	import crawlingtosea.debug.c2config;
	import crawlingtosea.debug.Debug;
	
	public class CSb2ShapePlus extends CSb2Shape
	{
		public function CSb2ShapePlus(b2world:b2World)
		{
			super(b2world);
		}
		
		public function GetBoxPlus(posx:int, posy:int, w:Number, h:Number,whatisit:int=0, s:String="", asset:Sprite=null):b2Body
		{
			var bodyDef:b2BodyDef = new b2BodyDef();
			bodyDef.position.Set(posx/ CSb2CV.WS, posy/ CSb2CV.WS);
			bodyDef.type = whatisit;
			
			bodyDef.userData = new Object();
			bodyDef.userData.name = s;
			if((asset!=null)&&(asset is Sprite)&&c2config.isInit)
			{
				bodyDef.userData.asset = asset;
				c2config.stage.addChild(bodyDef.userData.asset);
			}else{
				throw new Error(Debug.Error_DebugConfigIsClosed+"或所引用资源为空");
			}
			var polygonShape:b2PolygonShape = new b2PolygonShape();
			polygonShape.SetAsBox(w / 2 / CSb2CV.WS, h / 2 / CSb2CV.WS);
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			fixtureDef.shape = polygonShape;
//			fixtureDef.density=2;
			
			var b2body:b2Body = world.CreateBody(bodyDef);
			b2body.CreateFixture(fixtureDef);
			return b2body;
		}
		
		/*public function Resetb2FixtureByName(s:String="",b2fd:b2FixtureDef=null):void
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
		}*/
	}
}