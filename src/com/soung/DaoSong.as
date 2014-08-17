/**Powerd by www.riaby.cn CopyRight 2009-2010. see the licenses.txt.**/
package com.soung
{
	import com.babySchema.managers.EntryManager;
	public class DaoSong
	{
		public static function getModel(id:int):Song
		{
			return EntryManager.getModel(id,Song) as Song;
		}
		public static function getModelList(num:int):Array
		{
			return EntryManager.take(num,Song);
		}
		public static function update(model:Song):void
		{
			EntryManager.update(model);
		}
		public static function del(model:Song):void
		{
			EntryManager.del(model);
		}
		public static function insert(model:Song):void
		{
			model.sn=new Date().getTime();
			EntryManager.insert(model);
		}
		public static function slice(startIndex:int,size:int):Array
		{
			return EntryManager.slice(startIndex,size,Song);
		}
		public static function sql(sqlText:String):Object
		{
			return EntryManager.executeSql(sqlText,Song);
		}
	}
}