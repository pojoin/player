package com.util
{
	import com.babySchema.managers.EntryManager;
	
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.filesystem.File;
	public class SqlUtil
	{
		public static function setSQLConnectionToEntryManager():void{
			if(EntryManager.getConnection()==null){
				EntryManager.setConnection(new SqlUtil().getSQLConnection());
			}
		}
		
		private function getSQLConnection():SQLConnection{
			var dbFile:File=File.applicationStorageDirectory.resolvePath("player.db");
			var conn:SQLConnection=new SQLConnection();
			if(dbFile.exists){
				try{
					conn.open(dbFile);
				}catch(e:SQLError){
					trace(e.message);
				}
			}else{
				this.initDB(conn,dbFile);
			}
			return conn;
		}
		//初始化数据库
		private function initDB(conn:SQLConnection,dbFile:File):void{
			try{
				conn.open(dbFile);
				this.createTable(conn);
			}catch(e:SQLError){
				trace(e.message);
			}
		}
		
		//创建表
		private function createTable(conn:SQLConnection):void{
			var stmt:SQLStatement=new SQLStatement();
			var sql:String=
				"CREATE TABLE IF NOT EXISTS Song (" +  
				"id INTEGER PRIMARY KEY AUTOINCREMENT, " +
				"name TEXT, " +
				"url TEXT, " +
				"sn INTEGER" +
				");"+
				"CREATE TABLE IF NOT EXISTS PlayRole (" +
				"id INTEGER PRIMARY KEY AUTOINCREMENT, " +
				"role NUMBER" +
				")";
			try{
				stmt.sqlConnection=conn;
				stmt.text=sql;
				stmt.execute();
				stmt.sqlConnection=null;
				stmt=null;
			}catch(e:SQLError){
				trace(e.message);
				stmt.sqlConnection=null;
				conn.close();
				conn=null;
			}
		}

	}
}