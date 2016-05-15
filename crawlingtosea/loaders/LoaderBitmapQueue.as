package crawlingtosea.loaders
{
	import flash.events.EventDispatcher;
	
	import crawlingtosea.events.LoaderEvent;
	
	[Event(name="completed", type="crawlingtosea.events.LoaderEvent")]
	public class LoaderBitmapQueue extends EventDispatcher
	{
		
		private var _addressArr:Array=[];
		private var _addressLen:uint=0;
		private var _loaderBitmapArr:Array=[];
		private var _bitmapDataQueueArr:Array=[];
		private var _counter:uint=0;
		
		public function LoaderBitmapQueue(addressArr:Array=null)
		{
			_addressArr=addressArr;
			_addressLen=addressArr.length;
		}
		
		public function start():void{
			
			
			if(_addressLen!=0){
				for(var i:int=0;i<(_addressLen);i++){
					
					_loaderBitmapArr.push(new LoaderBitmap(_addressArr[i]));
					_loaderBitmapArr[i].start();
					LoaderBitmap(_loaderBitmapArr[i]).addEventListener(LoaderEvent.COMPLETED,onCompleted);
					
				}
			}
		}
		
		protected function onCompleted(event:LoaderEvent):void
		{
			// TODO Auto-generated method stub
			_counter++;
			if(_counter==_addressLen){
				for(var i:int=0;i<(_addressLen);i++){
					
					LoaderBitmap(_loaderBitmapArr[i]).removeEventListener(LoaderEvent.COMPLETED,onCompleted);
					_bitmapDataQueueArr.push(LoaderBitmap(_loaderBitmapArr[i]).bitmapData);
				}
				dispatchEvent(new LoaderEvent(LoaderEvent.COMPLETED));}
		}
		
		public function get queueData():Array{
			
			return _bitmapDataQueueArr;
			
		}
	}
}