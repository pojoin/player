package com.global
{
	import com.util.SqlUtil;
	
	import flash.events.EventDispatcher;

	public class Global extends EventDispatcher
	{
		private static var _instance:Global;
		public static function getInstance():Global{
			if(_instance==null){
				_instance=new Global();
				SqlUtil.setSQLConnectionToEntryManager();
				new Global().addEvtListener();
			}
			return _instance;
		}
		
		private function addEvtListener():void{
			
		}
		
		
	}
}