package org.utmost.variable
{
	public class TreeVar
	{
		public function TreeVar(){}
		/**
		 * delete tree object
		 * 
		 * @param tableName
		 * @param uuid
		 * @return Object
		 */
		public static function getDelObject(tableName:String,uuid:String):Object {
			var obj:Object=new Object();
			obj.tableName=tableName;//*
			obj.idField="uuid";//*
			obj.pidField="pid";//*
			obj.idValue=uuid;//*
			return obj;
		}
		/**
		 * role tree parameter
		 * 
		 * @param 
		 * @return Object
		 */
		public static function getRoleMainByTree():Object {
			var main:Object=new Object();
			main.tableName="U_PORTAL_ROLE";//*
			main.rootField="rolecode";//*
			main.rootValue="root";//be careful
			main.idField="uuid";//*
			main.pidField="pid";//*
			return main;
		}
		/**
		 * role kv parameter
		 * 
		 * @param 
		 * @return Object
		 */
		public static function getRoleKvByTree():Object {
			var kv:Object=new Object();
			kv.uuid="uuid";//*
			kv.rolecode="nodecode";//*
			kv.pid="pid";//*
			kv.rolename="nodename";//*
			kv.state="state";//*
			return kv;
		}
		/**
		 * function tree parameters
		 * 
		 * @param 
		 * @return Object
		 */
		public static function getFuncMainByTree():Object {
			var main:Object=new Object();
			main.tableName="U_PORTAL_FUNC";//*
			main.rootField="funccode";//*
			main.rootValue="root";//be careful
			main.idField="uuid";//*
			main.pidField="pid";//*
			return main;
		}
		/**
		 * function tree kv parameters
		 * 
		 * @param 
		 * @return Object
		 */
		public static function getFuncKvByTree():Object {
			var kv:Object=new Object();
			kv.uuid="uuid";//*
			kv.funccode="nodecode";//*
			kv.pid="pid";//*
			kv.funcname="nodename";//*
			kv.state="state";//*
			return kv;
		}
		
		
		/**
		 * organiztion tree params
		 * 
		 * @param 
		 * @return Object
		 */
		public static function getOrgMainByTree():Object {
			var main:Object=new Object();
			main.tableName="U_PORTAL_ORG";//*
			main.rootField="orgcode";//*
			main.rootValue="root";//be careful
			main.idField="uuid";//*
			main.pidField="pid";//*
			return main;
		}
		/**
		 * organiztion tree kv params
		 * 
		 * @param 
		 * @return Object
		 */
		public static function getOrgKvByTree():Object {
			var kv:Object=new Object();
			kv.uuid="uuid";//*
			kv.orgcode="nodecode";//*
			kv.pid="pid";//*
			kv.orgname="nodename";//*
			kv.state="state";//*
			return kv;
		}
	}
}