package com.sephiroth.controls
{
	import flash.events.Event;
	
	import com.sephiroth.controls.treeClasses.TreeCheckListData;
	import com.sephiroth.renderers.TreecheckboxItemRenderer;
	
	import mx.controls.Tree;
	import mx.controls.listClasses.BaseListData;
	import mx.controls.treeClasses.TreeListData;
	import mx.core.ClassFactory;
	import mx.core.mx_internal;
	import mx.events.TreeEvent;
	
	use namespace mx_internal;

	[Event(name="checkFieldChanged", type="flash.events.Event")]
	[Event(name="checkFunctionChanged", type="flash.events.Event")]
	[Event(name="itemCheck", type="mx.events.TreeEvent")]
	/**
	 * tree checkbox function class
	 * 
	 */
	public class TreeCheckBox extends Tree
	{
		protected var _checkField: String;
		private var _checkFunction: Function;
		
		public const ITEM_CHECK:String = "itemCheck";
		
		/**
		 * Constructor
		 */
		public function TreeCheckBox(){
			super( );
			//render item by define myself
			this.itemRenderer = new ClassFactory( TreecheckboxItemRenderer );
			//add 'itemCheck' listener event
			addEventListener( ITEM_CHECK, checkHandler );
		}
		/**
		 * judge is branch or not
		 * 
		 * @param item 
		 * @return Boolean
		 */
	    mx_internal function isBranch( item: Object ): Boolean{
	        if ( item != null )
	            return _dataDescriptor.isBranch( item, iterator.view );
	        return false;
	    }		
		/**
		 * check handler
		 * 
		 * @param event 
		 * @return 
		 */
 		private function checkHandler( event: TreeEvent ): void{
	    	var value: String;
	        var state: int = ( event.itemRenderer as TreecheckboxItemRenderer ).checkBox.checkState;
	        var middle: Boolean = ( state & 2 << 1 ) == ( 2 << 1 );
	        var selected: Boolean = ( state & 1 << 1 ) == ( 1 << 1 );

			if( isBranch( event.item ) ){
				middle = false;
			}  
	        
	        if( middle ){
	            value = "2";
	        } else {
	            value = selected ? "1" : "0";
	        }
	        
	        var data:Object = event.item;

	        if (data == null) {
	            return;
	        }
	
	        if( checkField ){
	            if ( data is XML ){
	                       data[ checkField ] = value;
	   
	            } else if ( data is Object ) {
	                    data[ checkField ] = value;
	            }
	         }
	
	        if ( data is String ) {
	            data = String( value );
	        }
	        commitProperties( );
	    }
		/**
		 * check list data
		 * 
		 * @param data 
		 * @param uid 
		 * @param rowNum 
		 * @return BaseListData
		 */
	    override protected function makeListData( data: Object, uid: String, rowNum: int): BaseListData{
	        var treeListData: TreeListData = new TreeCheckListData( itemToLabel( data ), uid, this, rowNum );
	        initListData( data, treeListData );
	        return treeListData;
	    }
	    /**
		 * initial list data
		 * 
		 * @param item 
		 * @param treeListData 
		 * @return 
		 */
	    override protected function initListData( item: Object, treeListData: TreeListData ): void
	    {
	    	super.initListData( item, treeListData );
	        if (item == null)
	            return;
	        ( treeListData as TreeCheckListData ).checkedState = itemToCheck( item );
	    }	    
		
    	[Bindable("checkFieldChanged")]
    	[Inspectable(category="Data", defaultValue="checked")]		
	    public function get checkField( ): String
	    {
	        return _checkField;
	    }
		/**
		 * check field
		 * 
		 * @param value 
		 * @return
		 */
	    public function set checkField( value: String ): void
	    {
	        _checkField = value;
	        itemsSizeChanged = true;
	        invalidateDisplayList( );
	        dispatchEvent( new Event("checkFieldChanged") );
	    }
	    /**
	    * check item
	    * 
	    * @param data 
		* @return
	    */
	    public function itemToCheck( data: Object ): int{
	        if (data == null )
	            return 0;
	
	        if ( checkFunction != null )
	            return checkFunction( data );
			//parse data according type of data
	        if ( data is XML ){
	                if ( data[ checkField ].length( ) != 0 )
	                    data = data[ checkField ];
	        }
	        else if ( data is Object ){
	                if ( data[ checkField ] != null )
	                    data = data[ checkField ];
	        }
	
	        try{
	            return parseInt( String( data ) );
	        }catch( e: Error ){
				trace("e:" + e.getStackTrace());
			}
			return 0;
	    }
	    
	    [Bindable("checkFunctionChanged")]
	    [Inspectable(category="Data")]
	    public function get checkFunction( ): Function{
	        return _checkFunction;
	    }
		/**
		 * check function
		 * 
		 * @param value 
		 * @return
		 */
	    public function set checkFunction( value: Function ): void{
	        _checkFunction = value;
	        itemsSizeChanged = true;
	        invalidateDisplayList( );
	        dispatchEvent( new Event("checkFunctionChanged") );
	    }	    
	    /**
	    * update tree status
	    * 
	    * @param xml 
	    * @param event 
		* @return
	    */
	    public function updateTreeStatus(xml:XML, event:TreeEvent):void{
				if (xml.children().length() > 0){
					for each(var x:XML in xml.node){
						trace("x:" + x);
						if (x.@checked == "1")
							updateParents(x, (event.itemRenderer as TreecheckboxItemRenderer).checkBox.checkState);
						updateTreeStatus(x, event);
					}
				}
			}

			/**
			 * Called on checkbox click
			 * check and update for both parents and child nodes
			 * according to the checkbox status
			 * 
			 * @param event 
			 * @return
			 */
			public function onItemCheck(event:TreeEvent):void{
				updateParents(event.item as XML, (event.itemRenderer as TreecheckboxItemRenderer).checkBox.checkState);
				updateChilds(event.item as XML, (event.itemRenderer as TreecheckboxItemRenderer).checkBox.checkState);
			}

			/**
			 * @see it.sephiroth.controls.CheckBoxExtended#checkState
			 *
			 * @param item 
			 * @param value 
			 * @return
			 */
			public function updateChilds(item:XML, value:uint):void
			{
				var middle:Boolean=(value & 2 << 1) == (2 << 1);
				if (item.children().length() > 0 && !middle){
					for each(var x:XML in item.node){
						x.@checked=value == (1 << 1 | 2 << 1) ? "2" : value == (1 << 1) ? "1" : "0";
						updateChilds(x, value);
					}
				}
			}
			/**
			 * upate parents
			 * 
			 * @param item 
			 * @param value 
			 * @return
			 */
			public function updateParents(item:XML, value:uint):void{
				var checkValue:String=(value == (1 << 1 | 2 << 1) ? "2" : value == (1 << 1) ? "1" : "0");
				var parentNode:XML=item.parent();
				if (parentNode){
					for each(var x:XML in parentNode.node){
						if (x.@checked != checkValue){
							checkValue="2";
						}
					}
					parentNode.@checked=checkValue;
					updateParents(parentNode, value);
				}
			}
			/**
			 * flash tree
			 * 
			 * @param _tree 
			 * @return
			 */
			public function flashTree(_tree:Tree):void{
				var e:TreeEvent=new TreeEvent(ITEM_CHECK);
				_tree.selectedIndex=1;
				e.itemRenderer=_tree.itemToItemRenderer(_tree.selectedItem);
				var xml:XML=_tree.selectedItem as XML;
				updateTreeStatus(xml, e);
			}
	}
}