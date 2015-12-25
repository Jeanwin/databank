package org.utmost.util
{
	import flash.events.MouseEvent;
	
	import flexlib.controls.ConvertibleTreeList;
	
	import mx.controls.ComboBox;
	import mx.controls.Tree;
	import mx.core.UIComponent;
	
	/**
	 * componet tool 
	 * */
	public class ComponentUtil
	{
		/**
		 * set invisible
		 * 
		 * @param o
		 * @param bool
		 * @return 
		 * */
		public static function setVisible(o:UIComponent,bool:Boolean):void {
			if(o==null)
			  return;
			o.visible=bool;
			o.includeInLayout=bool;
		}
		/**
		 * set combox value selected
		 * 
		 * @param o
		 * @param value
		 * @return 
		 * */
		public static function selectValue(o:ComboBox,value:String):void {
			var arr:Array=o.dataProvider.source;
			for(var i:int=0;i<arr.length;i++) {
				//judge if has value property
				if(arr[i]!=null&&arr[i].hasOwnProperty("value")) {
					if(value==arr[i].value.toString()) {
						o.selectedIndex=i;
						return;
					}
				}else {
					trace(o+"对象中未找到value属性");
				}
			}
		}

		/**
		 * expend all nodes collapsed index=0
		 * 
		 * @param tree
		 * @return 
		 * */
        public static function ocAllTree(tree:Tree):void {
			tree.selectedIndex=0;
			if(tree!=null&&tree.selectedItem!=null) {
				if(tree.isItemOpen(tree.selectedItem))
					tree.expandChildrenOf(tree.selectedItem,false);		//No expend node appointed
				else 
					tree.expandChildrenOf(tree.selectedItem,true);		//expend node appointed
			}
        }
        
        /**
		 * expend all tree nodes collapsed and selected
		 * 
		 * @param e
		 * @return
		 * */
        public static function ocSelectTree(e:MouseEvent):void {
        	var tree:Tree=e.currentTarget as Tree;
        	if(tree==null) {
        		tree=(e.currentTarget as ConvertibleTreeList).tree;// special handle
        	}
			if(tree!=null&&tree.selectedItem!=null) {
				if(tree.isItemOpen(tree.selectedItem))
					tree.expandChildrenOf(tree.selectedItem,false);		//Don't expend node
				else 
					tree.expandChildrenOf(tree.selectedItem,true);		//expend node
			}
        }
        
        
	}
}