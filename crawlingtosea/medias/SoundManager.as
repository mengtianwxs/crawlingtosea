package crawlingtosea.medias 
{
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.getTimer;
	
	public class SoundManager
	{
		private var soundsList:Array;
		private var soundChannelsList:Array;
		
		private var soundTrackChannel:SoundChannel;
		
		public function SoundManager()
		{
			soundsList= new Array();
			soundChannelsList = new Array();
		}
		public function addSound(soundName:String,sound:Sound):void{
			soundsList[soundName]=sound;
		}
		
		public function playSound(soundName:String, isSoundTrack:Boolean=false,loops:int=1):void{
			var tempSound:Sound = soundsList[soundName];
			if(isSoundTrack){
				if(soundTrackChannel!=null){
					soundTrackChannel.stop();
				}
				soundTrackChannel= tempSound.play();
			}else {
				//保存soundName音乐的soundChannel的引用
				soundChannelsList[soundName]=tempSound.play();
			}
		}
		public function stopSound(soundName:String,isSoundTrack:Boolean=false):void{
			if(isSoundTrack){
				if(soundTrackChannel!=null) soundTrackChannel.stop();
			}else {
				//停止soundName对应的soundChannel的播放
				soundChannelsList[soundName].stop();
			}
		}
		public function stopAllSounds():void{
			if(soundTrackChannel!=null) soundTrackChannel.stop();
			
			for each(var s:SoundChannel in soundChannelsList){
				s.stop();
			}
			
		}
	}
}