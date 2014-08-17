package com
{
	import com.global.Global;
	import com.playRole.PlayRoleAction;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	public class KPlayer
	{
		private var soundChannel:SoundChannel;
		private var sound:Sound=new Sound();
		private var songPauseTime:Number=0;
		private var volumeNum:Number=0.8;
		public var soundUrl:String;
		[Bindable]
		public var songTitle:String="";
		private var g:Global=Global.getInstance();
		
		private static var instance:KPlayer;
		
		public static function getInstance():KPlayer{
			if(instance==null){
				instance=new KPlayer();
				new KPlayer().addEvtListener();
			}
			return instance;
		}
		
		private function addEvtListener():void{
			
		}
		
		public function playSoung():void{
			var sUrl:URLRequest=new URLRequest(this.soundUrl);
			this.sound.addEventListener(Event.OPEN,onOpen);
			this.sound.addEventListener(IOErrorEvent.IO_ERROR,showError);
			this.sound.load(sUrl);
			
		}
		
		//播放
		public function play(type:String):void{
			if(this.soundUrl!=null&&this.soundUrl!=""){
			if(type=="select"){
				if(this.soundChannel!=null){
					this.soundChannel.stop();
					this.sound=new Sound();
				}
				this.playSoung();
			}else{
				if(this.soundChannel!=null){
					this.soundChannel=this.sound.play(this.songPauseTime);
				}else{
					this.playSoung();
				}
				
			}
			}
			
		}
		
		//暂停
		public function pauseSoung():void{
			if(this.soundUrl!=null&&this.soundUrl!=""){
				this.songPauseTime=this.soundChannel.position;
				this.soundChannel.stop();
			}
		}
		
		//停止
		public function stop():void{
			if(this.soundChannel!=null){
				this.songPauseTime=0;
				this.soundChannel.stop();
			}
		}
		
		//打开时播放
		private function onOpen(evt:Event):void{
			if(this.soundChannel!=null){
				this.soundChannel.stop();
			}
			this.soundChannel=this.sound.play();
//			this.setNowVolume();
		}
		private function showError(evt:Event):void{
			trace("error");
		}
		
		public function checkChannel():Boolean{
			var b:Boolean=false;
			if(this.soundChannel!=null){
				b=true;
			}
			return b;
		}
		public function getSongProgress():Number{
			var i:Number=0;
			try{
				i=this.soundChannel.position/this.sound.length;
			}catch(e:Error){
				trace(e.message);
			}
			return i;
		}
		
		public function getSongPauseTime():Number{
			var time:Number=0;
			if(this.soundChannel!=null){
				time=this.songPauseTime;
			}
			return this.songPauseTime;
		}
		
		public function contiunPlay(index:Number):void{
			if(this.soundChannel!=null){
				this.soundChannel=this.sound.play(index*this.sound.length);
//				this.setNowVolume();
			}
		}
		private function setNowVolume():void{
			if(this.soundChannel!=null){
			var tmpTransform:SoundTransform=this.soundChannel.soundTransform;
				tmpTransform.volume=this.volumeNum;
				this.soundChannel.soundTransform=tmpTransform;
			}
		}
		public function setVolume(index:Number):void{
			this.volumeNum=index;
			if(this.soundChannel!=null){
				var my_transform:SoundTransform=this.soundChannel.soundTransform;
				my_transform.volume=index;
				this.soundChannel.soundTransform=my_transform;
			}
		}

	}
}