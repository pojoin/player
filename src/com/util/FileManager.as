package com.util
{
	import com.global.Global;
	import com.soung.DaoSong;
	import com.soung.Song;
	
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	
	public class FileManager
	{
		private var ext:String="*.wma;*.mp3";
		private var g:Global=Global.getInstance();
		//打开类型为txt和xml的文件。
		public function openFile():void{
  			var file:File =new File();
 		 	var openFileFilter:FileFilter = new FileFilter("*",ext );  //过滤文件
  			file.browseForOpen("请选择要播放的文件",[openFileFilter]); //打开文件选择器
  			file.addEventListener(Event.SELECT,fileSelectHandle)   //监听文件选择事件
		}
		private function fileSelectHandle(e:Event):void{
  			var file:File = e.target as File;
  			var s:Song=new Song();
  			s.name=file.name;
  			s.url="file://"+file.nativePath;
  			DaoSong.insert(s);
  			g.dispatchEvent(new Event("refresh"));
		}
		
		public function openFolder():void{
			var file:File=new File();
			file.browseForDirectory("请选择一个多媒体文件夹");
			file.addEventListener(Event.SELECT,addFilesToDB);
		}
		private function addFilesToDB(evt:Event):void{
			var file:File=evt.target as File;
			var tmpFile:File=null;
			var index:int=0;
			var tmpExt:String=null;
			var fileArray:Array=file.getDirectoryListing();
			for(var i:int=0;i<fileArray.length;i++){
				tmpFile=fileArray[i] as File;
				if(!tmpFile.isHidden){
					index=tmpFile.name.lastIndexOf(".")+1;
					if(index!=tmpFile.name.length-1){
						tmpExt=tmpFile.name.substr(index);
						if(isMedir(tmpExt)){
							var s:Song=new Song();
							s.name=tmpFile.name;
							s.url="file://"+tmpFile.nativePath;
							DaoSong.insert(s);
							s=null;
						}
					}
				}
				tmpExt=null;
				tmpFile=null;
			}
			g.dispatchEvent(new Event("refresh"));
		}
		private function isMedir(fileExt:String):Boolean{
			var arr:Array=this.ext.split(";");
			var b:Boolean=false;
			var tmp:String=null;
			for(var i:int=0;i<arr.length;i++){
				tmp=arr[i] as String;
				tmp=tmp.substr(2);
				if(tmp==fileExt){
					b=true;
					break;
				}
			}
			return b;
		}
		
	}
}