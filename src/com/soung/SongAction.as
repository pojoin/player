package com.soung
{
	import com.global.Global;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	public class SongAction
	{
		private var g:Global=Global.getInstance();
		public function list():ArrayCollection{
			var array:Array=DaoSong.getModelList(1000);
			if(array!=null){
				var arrCol:ArrayCollection=new ArrayCollection();
				for(var i:int;i<array.length;i++){
					arrCol.addItem(array[i]);
				}
			}
			return arrCol;
		}
		
		public function delSong(arr:Array):void{
			var s:Song=this.ArrayToSong(arr);
			if(s!=null){
				DaoSong.del(s);
			}
		}
		
		private function ArrayToSong(item:Array):Song{
			var s:Song=new Song();
			if(item!=null){
				s.id=item[0].id;
				s.name=item[0].name;
				s.sn=item[0].sn;
				s.url=item[0].url;
			}
			return s;
		}
	}
}