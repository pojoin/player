/**Powerd by www.riaby.cn CopyRight 2009-2010. see the licenses.txt.**/
package com.playRole
{
	import com.babySchema.managers.EntryManager;
	public class DaoPlayRole
	{
		public static function getModel(id:int):PlayRole
		{
			return EntryManager.getModel(id,PlayRole) as PlayRole;
		}
		public static function getModelList(num:int):Array
		{
			return EntryManager.take(num,PlayRole);
		}
		public static function update(model:PlayRole):void
		{
			EntryManager.update(model);
		}
		public static function del(model:PlayRole):void
		{
			EntryManager.del(model);
		}
		public static function insert(model:PlayRole):void
		{
			EntryManager.insert(model);
		}
		public static function slice(startIndex:int,size:int):Array
		{
			return EntryManager.slice(startIndex,size,PlayRole);
		}
		public static function sql(sqlText:String):Object
		{
			return EntryManager.executeSql(sqlText,PlayRole);
		}
	}
}