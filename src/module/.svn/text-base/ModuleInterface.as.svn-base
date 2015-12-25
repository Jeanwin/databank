package module
{
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	/**
	 * moudule interface
	 */
	public interface ModuleInterface extends IEventDispatcher
	{
		/**
		 * current object node, obj has four field:nodeuuid, rootuuid, language and showstate
		 * 
		 * @param _node
	     * @return 
		 */
		function set $treeSelectNode(_node:Object):void;
		/**
		 * directory tree data
		 * 
		 * @param _tree
	     * @return 
		 */
		function set $moduletree(_tree:ArrayCollection):void;
		/**
		 * navigator data
		 * 
		 * @param _tree
	     * @return
		 */
		function set $menuData(_tree:ArrayCollection):void;
		/**
		 * save current uuid of node selected when select the property page of category
		 * 
		 * @param _funcuuid
	     * @return
		 */
		function set $selectNodeFuncUUID(_funcuuid:String):void;
	}
}