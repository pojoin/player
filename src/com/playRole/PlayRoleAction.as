package com.playRole
{
	public class PlayRoleAction
	{
		public function updatePlayRole(num:Number):void{
			var arr:Array=DaoPlayRole.getModelList(10);
			var pr:PlayRole=null;
			if(arr!=null){
				pr=arr[0];
				pr.role=num;
				DaoPlayRole.update(pr);
			}else{
				pr=new PlayRole();
				pr.role=num;
				DaoPlayRole.insert(pr);
				pr=DaoPlayRole.getModel(1);
				pr.role=num;
				DaoPlayRole.update(pr);
			}
			
		}
		
		public function getPlayRoleNum():Number{
			var num:Number=0;
			var pr:PlayRole=DaoPlayRole.getModel(1);
			num=pr.role;
			return num;
		}

	}
}