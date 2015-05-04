package crawlingtosea.medias 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	import crawlingtosea.core.c2debug;
	
	/**
	 * 测试类暂时不对外公开 
	 * @author newer
	 * 
	 */	
	internal class SoundManager
	{
		private var soundsList:Array;
		private var soundChannelsList:Array;
		
		private var soundTrackChannel:SoundChannel;
		
		use namespace c2debug;
		
		public function SoundManager()
		{
			soundsList= new Array();
			soundChannelsList = new Array();
		}
		c2debug function addSound(soundName:String,sound:Sound):void{
			soundsList[soundName]=sound;
		}
		
		c2debug function playSound(soundName:String, isSoundTrack:Boolean=false,loops:int=1):void{
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
		c2debug function stopSound(soundName:String,isSoundTrack:Boolean=false):void{
			if(isSoundTrack){
				if(soundTrackChannel!=null) soundTrackChannel.stop();
			}else {
				//停止soundName对应的soundChannel的播放
				soundChannelsList[soundName].stop();
			}
		}
		c2debug function stopAllSounds():void{
			if(soundTrackChannel!=null) soundTrackChannel.stop();
			
			for each(var s:SoundChannel in soundChannelsList){
				s.stop();
			}
			
		}
	}
}