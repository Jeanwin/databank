package org.utmost.util
{
	import flash.display.DisplayObject;
	
	import mx.controls.CheckBox;
	import mx.controls.ComboBox;
	import mx.core.Container;
	
	/**
	 * page component value mapping tool class
	 * */
	public class AutoUtil
	{
		
		
		/**
		 * Obtain id
		 * 
		 * @param obj
		 * @return String
		 * */
		private static function getId(obj:Object):String {
			var tmp:String=obj.toString();
			var arr:Array=tmp.split(".");  //spliting in '.'
			if(arr.length>0) 
				tmp=arr[arr.length-1];
			return tmp;
		}
		/**
		 * obtain name
		 * 
		 * @param obj
		 * @return String
		 * */
		private static function getName(obj:Object):String {
			var tmp:String;
			//judge obj if has name property first
			if(obj.hasOwnProperty("name")) {
				tmp=obj.name;
			}
			return tmp;
		}
		/**
		 * obtain type
		 * 
		 * @param obj
		 * @return String
		 * */
		private static function getType(obj:Object):String {
			var tmp:String=obj.toLocaleString();
			tmp=tmp.replace("[object ","").replace("]","");
			return tmp;
		}
		

		
        /**
		/**
		 * According type of elements gets ValueType obtain value type according type
		 * 
		 * @param s
		 * @return String
		 * */
		private static function getVT(s:String):String {
			if(s=="TextInput"||s=="TextArea")
				return "text";
			else if(s=="Button") 
				return "label";
			else if(s=="NumericStepper")
				return "value";
			else if(s=="ComboBox")
				return "value";
			else if(s=="DateField")
				return "text";
				
			return null;
		}

		/**
		 * obtain component id-value corresponding
		 * 
		 * @param s
		 * @param _obj
		 * @return Object
		 * */
		public static function findValue(s:Container,_obj:Object=null):Object {
			var obj:Object;
			if(_obj==null) {
				obj=new Object();
			}else {
				obj=_obj;
			}
			var arr:Array=s.getChildren();
			for(var i:int=0;i<arr.length;i++) {
				//if has getChildren property
				if(arr[i].hasOwnProperty("getChildren")&&arr[i].getChildren()!==null){
						findValue(arr[i],obj);
					}
				var id:String=getId(arr[i]);
				var name:String=getName(arr[i]);
				var type:String=getType(arr[i]);
				var vp:String=getVT(type);
				var value:String;
				if(type=="FormItem"||type=="Button"||type=="FormHeading") 
					continue;
				//ComboBox special handle
				if(type=="ComboBox"&&arr[i].selectedItem!=null) {
					if(arr[i].hasOwnProperty("@value")) {
						value=arr[i].selectedItem.@value;
					}else if(arr[i].hasOwnProperty("value")) {
						value=arr[i].selectedItem.value;
					}else {
						trace(id+" not find property value or @value !");
					}
					
				}
				if(vp!=null&&type!="ComboBox") 
					value=arr[i][vp];
				if(type=="TextInput"||type=="TextArea"||type=="ComboBox"||type=="NumericStepper") {
					obj[id]=value;
				}
				trace(id+"--"+name+"--"+type+"--"+value);
			}
			return obj;
		}
		
		/**
		 * clear all elements value of container
		 * 
		 * @param o
		 * @return 
		 * */
		public static function clearValue(_o:Container):void {
			var arr:Array=_o.getChildren();
				for(var i:int=0;i<arr.length;i++) {
					if(arr[i].hasOwnProperty("getChildren")&&arr[i].getChildren()!==null) {
							clearValue(arr[i]);		//recursive clear all children
					}
					var o:Object=arr[i];
					var type:String=AutoUtil.getType(o);
					var valuetype:String=AutoUtil.getVT(type);
					if(type=="TextInput"||type=="TextArea"||type=="NumericStepper") {
						o[valuetype]="";
					}
					if(type=="ComboBox") {
						ComponentUtil.selectValue(o as ComboBox,"none");
					}
			}
		}
		/**
		 * obtain component instance according id
		 * 
		 * @param _id
		 * @param _o
		 * @return DisplayObject
		 * */
		public static function getObjById(_id:String,_o:Container):DisplayObject {
			var arr:Array=_o.getChildren();
				for(var i:int=0;i<arr.length;i++) {
					if(arr[i].hasOwnProperty("getChildren")&&arr[i].getChildren()!==null) {
							var tempObj:Object=getObjById(_id,arr[i]);	//recursive find object
							if(tempObj!=null) {
								return tempObj as DisplayObject;
							}
					}
					var o:Object=arr[i];
					var id:String=AutoUtil.getId(o);
					if(id==_id) {
						trace("return getObjById:"+id+"--"+_id);
						return o as DisplayObject;
					}
			}
			return null;
		}
		/**
		 * Fill elements value
		 * 
		 * @param _o
		 * @param data
		 * @return 
		 * */
		public static function fillValue(_o:Container,data:Object):void {
			var arr:Array=_o.getChildren();
			for(var i:int=0;i<arr.length;i++) {
				if(arr[i].hasOwnProperty("getChildren")&&arr[i].getChildren()!==null) {
						fillValue(arr[i],data);		//recursive fill value
				}
				var o:Object=arr[i];
				var id:String=AutoUtil.getId(o);
				var type:String=AutoUtil.getType(o);
				var valuetype:String=AutoUtil.getVT(type);
				var value:String=data[id];
				if(data[id]!=undefined&&data.hasOwnProperty(id)) {
						if(type=="TextInput"||type=="TextArea"||type=="NumericStepper"||type=="DateField") {
							o[valuetype]=value;
						}
						if(type=="ComboBox") {
							ComponentUtil.selectValue(o as ComboBox,value);
						}
				}
			}
		}
		/**
		 * selecte all
		 * 
		 * @param s
		 * @param _obj
		 * @param _boolean
		 * @return Object
		 */
		public static function selectAllCheckBox(s:Container,_obj:Object=null,_boolean:Boolean=true):Object {
			var obj:Object;
			if(_obj==null) {
				obj=new Object();
			}else {
				obj=_obj;
			}
			var arr:Array=s.getChildren();
			for(var i:int=0;i<arr.length;i++) {
				if(arr[i].hasOwnProperty("getChildren")&&arr[i].getChildren()!==null){
						selectAllCheckBox(arr[i],obj,_boolean);  //recursive
					}
				var id:String=getId(arr[i]);
				var type:String=getType(arr[i]);
				obj=getObjById(id,s);
				if(type=="CheckBox"&&(obj as CheckBox).enabled) {
						(obj as CheckBox).selected=_boolean;
				}
			}
			return obj;
		}
		
		
	}
}