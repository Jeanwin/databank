package com.right
{
	import module.manage;
	
	import mx.collections.ArrayCollection;
	/**
	 * UserRight
	 * This class contain all items of menus,
	 * all items of func node,user info,scope
	 * and so on
	 * 
	 * */
	public class UserRight
	{
		//The directory tree
		public static var menus:ArrayCollection;
		
		//The function of menu tree
		public static var funcs:ArrayCollection;
		
		//User information
		//user all information put here
		public static var userInfo:Object;
		
		//User login way
		public static var scope:String = "view";
		
		//store manage to call by loaded module
		//manage is father of all module
		public static var father:manage;
		
		//store databank to show download list count
		public static var grandpa:databank;
		
		//user role
		//admin role and report preview role put here
		public static var role:ArrayCollection;
		
		/**
		 * Menu node if has judge privileges(1:yes 0:no)
		 * 
		 * @param funcuuid
		 * @param operateuuid
		 * @return String
		 * */
		public static function hasMenuRight(funcuuid:String, operateuuid:String):String{
			//this is super administrator
			if(userInfo.uuid === "777"){
				return "1";
			}
			
			var flag:String = "0";
			//iterator menus all items for checking 
			//user can/can't view this node
			for(var i:int=0; i<menus.length; i++){
				var menuObj:Object = menus.getItemAt(i);
				if(operateuuid === "1"){
					if(menuObj.funcuuid === funcuuid && (menuObj.operateuuid === "1" || menuObj.operateuuid === "2" || menuObj.operateuuid === "3" || menuObj.operateuuid === "4") ){
						flag = "1";
						break;
					}
				}else{
					if(menuObj.funcuuid === funcuuid && menuObj.operateuuid === operateuuid){
						flag = "1";
						break;
					}
				}
			}
			
			return flag;
		}
		
		public static function hasFuncRight(funcuuid:String, operateuuid:String):String{
			//this is super administrator
			if(userInfo.uuid === "777"){
				return "1";
			}
			
			var flag:String = "0";
			//iterator func all items for checking 
			//user can/can't access this node
			
			for(var i:int=0; i<funcs.length; i++){
				var funcObj:Object = funcs.getItemAt(i);
				if(operateuuid === "1"){
					if(funcObj.funcuuid === funcuuid && (funcObj.operateuuid === "1" || funcObj.operateuuid === "2" || funcObj.operateuuid === "3" || funcObj.operateuuid === "4") ){
						flag = "1";
						break;
					}
				}else{
					if(funcObj.funcuuid === funcuuid && funcObj.operateuuid === operateuuid){
						flag = "1";
						break;
					}
				}
			}
			
			return flag;
		
		}
		/**
		 * judge button display or not display by nodeuuid
		 * if user uuid is 777, this user is super user,
		 * then this function obtain a true.
		 * if is not super user, return a boolean var from 
		 * transfering in variable nodeuuid
		 * 
		 * @param nodeuuid
		 * @return Boolean
		 * */
		public static function isShowbutton(nodeuuid:String):Boolean{
			//this is super user
			if(userInfo.uuid === "777"){
				return true;
			}
			
			//Judge user not in front, and has privileges input information, then display, 
			//5 represent manage info permission
			return scope!=="view"&&hasMenuRight(nodeuuid,"5")==="1"? true: false;
		}
		/**
		 * Has(or has not) function node judging in jurisdiction(1:yes 0:no)
		 * 
		 * @param funcuuid
		 * @return String
		 * */
		public static function hasFunc(funcuuid:String):String{
			//uuid 777 is super user
			if(userInfo.uuid === "777"){
				return "1";
			}
			//set a flag default is 0(has not function node)
			var flag:String = "0";
			//Iterator all funcs, 
			//if one of funcs equals funcuuid, set flag is 1,
			//meaning has this function node
			for(var i:int=0; i<funcs.length; i++){
				var funcObj:Object = funcs.getItemAt(i);
				if(funcObj.funcuuid === funcuuid){
					flag = "1";
					break;
				}
			}
			
			return flag;
		}
		
		/**
		 * Obtain login user info
		 * 
		 * @param 
		 * @return Object
		 * */
		public static function getloginUserInfo():Object{
			return userInfo;
		}
		
		/**
		 * Obtain login user uuid
		 * 
		 * @param 
		 * @return String
		 * */
		public static function getUserUUID():String{
			return userInfo.uuid;
		}
		
		
	}
}