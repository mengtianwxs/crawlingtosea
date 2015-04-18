package crawlingtosea.methods
{	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * 位图碰撞检测
	 * @author mengtianwxs
	 * @createTime 2013-8-22
	 */
	public function Collide(sp1:Sprite=null,sp2:Sprite=null):Boolean
	{
		var bmpd1:BitmapData=new BitmapData(sp1.width,sp1.height,true,0);
		bmpd1.draw(sp1);
		
		var bmpd2:BitmapData=new BitmapData(sp2.width,sp2.height,true,0);
		bmpd2.draw(sp2);
		
		return bmpd1.hitTest(new Point(sp1.x,sp1.y),255,bmpd2,new Point(sp2.x,sp2.y),255);
	}
}