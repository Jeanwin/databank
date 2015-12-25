
package com{
	import mx.events.AdvancedDataGridEvent;
	import mx.utils.ObjectUtil; 
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	/**
	 * No. sorting function class
	 * 
	 */	
	public class AdvancedSorting {
		
			/**
			 * sort No. column
			 * 
			 * @param evt
		 	 * @return
			 */
			public static function advancedDataGridSort(evt:AdvancedDataGridEvent):void {  
			    var column:AdvancedDataGridColumn = AdvancedDataGridColumn(evt.currentTarget.columns[evt.columnIndex]);  
			    var columnName:String=column.dataField;
			    if("standard_no"===columnName){ 
				    column.sortCompareFunction=function(obj1:Object,obj2:Object):int{  
				        return superSort(obj1,obj2,columnName);  
				    };  
			    }
			} 
			/**
			 * eg: obj1:GB 5763-2008  obj2:GB/T 7034-1998
			 * 
			 * @param obj1:compare object one
			 * @param obj2:compare object two
			 * @param columnName
		 	 * @return int
			 */
			private static function superSort(obj1:Object,obj2:Object,columnName:String):int{ 
				 var returnNum:int = 0;
				 var objStr1:String = obj1[columnName];
				 var objStr2:String = obj2[columnName];
				 //[GB,5763-2008]
				 var arrayStr1:Array = objStr1.split(" ");
				 //[GB,7034-1998]
				 var arrayStr2:Array = objStr2.split(" ");
				 var firstComp:int = ObjectUtil.stringCompare(arrayStr1[0],arrayStr2[0],false);
				 if(firstComp===0){
				 	//[5763,2008]
				 	var arrayStr11:Array = arrayStr1[1].split("-");
				 	//[7034,1998]
				 	var arrayStr21:Array = arrayStr2[1].split("-");
				 	var secondComp:int = ObjectUtil.numericCompare(arrayStr11[0],arrayStr21[0]);
				 	if(secondComp===0){
					 	var thirdComp:int = ObjectUtil.numericCompare(arrayStr11[1],arrayStr21[1]);
					 	returnNum = thirdComp;
				 	}else{
				 		returnNum = secondComp;
				 	}
				 }else{
				 	returnNum = firstComp;
				 }
			     return returnNum;  
			}
	}	  
}