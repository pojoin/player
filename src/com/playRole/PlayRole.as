/**Powerd by www.riaby.cn CopyRight 2009-2010. see the licenses.txt.**/
package com.playRole
{
	import com.babySchema.interfaces.IDataModel;
	import flash.data.SQLStatement;
	public class PlayRole implements IDataModel
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
		public var role:Number;
		public function _____getUpdateStatement():SQLStatement
		{
			if(UpdateStatement.text == ""){
				UpdateStatement.text ="UPDATE main.PlayRole SET role = :role WHERE id = :id";
			UpdateStatement.parameters[":role"] = role;
			}
			UpdateStatement.parameters[":id"] = id;
			return UpdateStatement;
		}
		public function _____getInsertStatement():SQLStatement
		{
			if(InsertStatement.text == ""){
				InsertStatement.text ="INSERT INTO main.PlayRole (role) VALUES(:role)";
			}
			InsertStatement.parameters[":role"] = role;
			return InsertStatement;
		}
		public function _____getDeleteStatement():SQLStatement
		{
			if(DeleteStatement.text == ""){
				DeleteStatement.text ="DELETE FROM main.PlayRole WHERE id = :id";
			}
			DeleteStatement.parameters[":id"] = id;
			return DeleteStatement;
		}
		public function _____getSelectStatement():SQLStatement
		{
			if(SelectStatement.text == ""){
				SelectStatement.itemClass = PlayRole;
				SelectStatement.text ="SELECT * FROM main.PlayRole";
			}
			return SelectStatement;
		}
		public function _____getWhereStatement():SQLStatement
		{
			if(WhereStatement.text == ""){
				WhereStatement.itemClass = PlayRole;
				WhereStatement.text ="SELECT * FROM main.PlayRole WHERE id = :selectkey";
			}
			return WhereStatement;
		}
		public function _____getSliceStatement():SQLStatement
		{
			if(SliceStatement.text == ""){
				SliceStatement.itemClass = PlayRole;
				SliceStatement.text ="SELECT * FROM main.PlayRole LIMIT :startIndex , :pageSize";
			}
			return SliceStatement;
		}
		public function _____getForeignStatement():SQLStatement
		{
			if(ForeignStatement.text == ""){
				ForeignStatement.itemClass = PlayRole;
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