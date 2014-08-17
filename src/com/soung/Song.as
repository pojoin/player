/**Powerd by www.riaby.cn CopyRight 2009-2010. see the licenses.txt.**/
package com.soung
{
	import com.babySchema.interfaces.IDataModel;
	import flash.data.SQLStatement;
	public class Song implements IDataModel
	{
		private static var UpdateStatement:SQLStatement = new SQLStatement();
		private static var InsertStatement:SQLStatement = new SQLStatement();
		private static var DeleteStatement:SQLStatement = new SQLStatement();
		private static var SelectStatement:SQLStatement = new SQLStatement();
		private static var WhereStatement:SQLStatement = new SQLStatement();
		private static var ForeignStatement:SQLStatement = new SQLStatement();
		private static var DelForeignStatement:SQLStatement = new SQLStatement();
		private static var SliceStatement:SQLStatement = new SQLStatement();
		public var id:int;
		public var name:String;
		public var url:String;
		public var sn:int;
		public function _____getUpdateStatement():SQLStatement
		{
			if(UpdateStatement.text == ""){
				UpdateStatement.text ="UPDATE main.Song SET name = :name , url = :url , sn = :sn WHERE id = :id";
			UpdateStatement.parameters[":name"] = name;
			}
			UpdateStatement.parameters[":url"] = url;
			UpdateStatement.parameters[":sn"] = sn;
			UpdateStatement.parameters[":id"] = id;
			return UpdateStatement;
		}
		public function _____getInsertStatement():SQLStatement
		{
			if(InsertStatement.text == ""){
				InsertStatement.text ="INSERT INTO main.Song (name,url,sn) VALUES(:name,:url,:sn)";
			}
			InsertStatement.parameters[":name"] = name;
			InsertStatement.parameters[":url"] = url;
			InsertStatement.parameters[":sn"] = sn;
			return InsertStatement;
		}
		public function _____getDeleteStatement():SQLStatement
		{
			if(DeleteStatement.text == ""){
				DeleteStatement.text ="DELETE FROM main.Song WHERE id = :id";
			}
			DeleteStatement.parameters[":id"] = id;
			return DeleteStatement;
		}
		public function _____getSelectStatement():SQLStatement
		{
			if(SelectStatement.text == ""){
				SelectStatement.itemClass = Song;
				SelectStatement.text ="SELECT * FROM main.Song";
			}
			return SelectStatement;
		}
		public function _____getWhereStatement():SQLStatement
		{
			if(WhereStatement.text == ""){
				WhereStatement.itemClass = Song;
				WhereStatement.text ="SELECT * FROM main.Song WHERE id = :selectkey";
			}
			return WhereStatement;
		}
		public function _____getSliceStatement():SQLStatement
		{
			if(SliceStatement.text == ""){
				SliceStatement.itemClass = Song;
				SliceStatement.text ="SELECT * FROM main.Song LIMIT :startIndex , :pageSize";
			}
			return SliceStatement;
		}
		public function _____getForeignStatement():SQLStatement
		{
			if(ForeignStatement.text == ""){
				ForeignStatement.itemClass = Song;
			}
			return null;
		}
		public function _____getDelForeignStatement():SQLStatement
		{
			if(DelForeignStatement.text == ""){
			}
			return null;
		}
	}
}