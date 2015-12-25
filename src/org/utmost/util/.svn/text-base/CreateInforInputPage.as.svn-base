package org.utmost.util
{
	import com.right.UserRight;
	
	import component.upload.categories.homologation;
	import component.upload.categories.information;
	import component.upload.categories.policy;
	import mx.utils.StringUtil;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.containers.Form;
	import mx.containers.FormItem;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.ComboBox;
	import mx.controls.DateField;
	import mx.controls.TextInput;
	import mx.rpc.events.ResultEvent;
	
	import org.utmost.mycomponents.Components_DateField;
	import org.utmost.mycomponents.Components_TextInput;
	import org.utmost.service.UtmostService;
	public class CreateInforInputPage
	{
		//save list containing controllers dynamic generation
		private static  var  itemArray:ArrayCollection;
		//item mapping
		public static var itemMap:ArrayCollection;	
		
		/**
		 * @param fields :packaging all fields of list
		 * @return VBox  :Vbox packaged
		 * createPage notice：
		 * 		The type of Object must contain FIELD_NAME(generating Label filed), FIELD_TYPE(generating type of obj) in fields,
		 * 		currently, FIELD_TYPE only support ComboBox and TextInput, if is ComboBox, Object must has FIELD_VALUE, 
		 * 		and value spliting in '/',
		 * 		if is TextInput, Object must has REGEX, as verify rules.
		 * */
		 public static var form:Form=null;
		public static function createPage(fields:ArrayCollection):VBox{
			
			itemMap = new ArrayCollection();
			
			//Total vbox
			if(itemArray===null){
				itemArray=new ArrayCollection();
			}else{
				itemArray.removeAll();
			}
			var vbox:VBox=new VBox();
			vbox.id="v2";
			vbox.setStyle("paddingTop","10");
			vbox.setStyle("horizontalAlign","center");
			//form
			form=new Form();
			form.id="form1";
			vbox.setStyle("horizontalAlign","right");
			form.setStyle("verticalGap","20");
			//Iterator, dynamic add element to form
			var itemObj:Object = null;
			var item:FormItem = null;
			var comboBox:ComboBox = null;
			var textInput:Components_TextInput = null;
			var dateInput:Components_DateField = null;
			var infoFiles:policy =null;
			var homo:homologation= null;
			var info:information= null;
			for each(var field:Object in fields){
				//segment object of dynamic form: itemName(segment name) itemType(segment type) itemInput(segment form object)
				        itemObj = new Object();	
				
				        item=new FormItem();
						item.label=field.FIELD_NAME;
						item.setStyle("fontWeight","bold");
						item.height=25;
						//judging if is requirment
							if(field!=null&&(field.REGEX==="."||field.REGEX==="^.{1,2000}$"||field.REGEX==="^.{1,400}$"||field.REGEX==="^.{1,200}$"||field.REGEX==="^.{1,100}$"||field.REGEX==="^\d\d\d\d\d([.]\d)?$")){
									item.required=true;
							}
						//if is combobox, special handle
						if(field.FIELD_TYPE==="ComboBox"){
							comboBox=new ComboBox();
							comboBox.id=field.ID;
							comboBox.width=200;
							comboBox.toolTip=field.tooltip;
							//FIELD_VALUE spliting in '/'
							comboBox.dataProvider=String(field.FIELD_VALUE).split("/");
							item.addChild(comboBox);
							itemArray.addItem(comboBox);
							itemObj["itemName"] = field.ID;
							itemObj["itemType"] = field.FIELD_TYPE;
							itemObj["itemInput"] = comboBox;
							
						}else if(field.FIELD_TYPE==="TextInput"){
							textInput=new Components_TextInput();
							textInput.id=field.ID;
							textInput.width=200;
							textInput.toolTip=field.tooltip;
							textInput.regex=field.REGEX;
	                        itemArray.addItem(textInput);
							item.addChild(textInput);
							
							itemObj["itemName"] = field.ID;
							itemObj["itemType"] = field.FIELD_TYPE;
							itemObj["itemInput"] = textInput;
							
						}else if(field.FIELD_TYPE==="DateField"){
						    dateInput=new Components_DateField();
							dateInput.id=field.ID;
							dateInput.width=215;
							dateInput.toolTip=field.tooltip;
							dateInput.regex=field.REGEX;
							//format date "yyyy-mm-dd"(database date format:mm/dd/yyy)
							dateInput.formatString="YYYY-MM-DD";
	                        itemArray.addItem(dateInput);
							item.addChild(dateInput);
							
							itemObj["itemName"] = field.ID;
							itemObj["itemType"] = field.FIELD_TYPE;
							itemObj["itemInput"] = dateInput;
							
						}else{
						   if(field.type==="infoFiles"){
						   		infoFiles=new policy();
						   		itemArray.addItem(infoFiles);
								item.addChild(infoFiles);
						   }
						   if(field.type==="homo"){
						   		homo=new homologation();
						   		itemArray.addItem(homo);
								item.addChild(homo);
						   }
						   if(field.type==="info"){
						   		info=new information();
						   		itemArray.addItem(info);
								item.addChild(info);
						   }
						}
					   	
					   	itemMap.addItem(itemObj);
					   	
					    form.addChild(item);
					    
			}
			vbox.addChild(form);
			return vbox;
			
		}
		
		/**
		 * 
		 * clean all the fields content
		 * 
		 * @param
		 * @return 
		 * */
		public static function cleanPageContent():void{
			if(itemMap!==null){
				for each(var item:Object in itemMap){
					if(item!==null){
						if(item["itemType"]==="ComboBox"){
							var comboBox:ComboBox = item["itemInput"] as ComboBox;
							comboBox.selectedIndex = 0;
						}else if(item["itemType"]==="TextInput"){
							var textInput:TextInput = item["itemInput"] as TextInput;
							textInput.text = null;
						}else if(item["itemType"]==="DateField"){
							var dateField:DateField = item["itemInput"] as DateField;
							dateField.text = null;
						}
					}
				}
			}
		}
		
		/**
		 * validate page data
		 * @return true：pass，false：no pass
		 * @param vbox：vbox needing to validate（vbox is dynamic generation）
		 * */
		public static function validate():Boolean{
			//get form validated from VBox
			var bool:Boolean=true;
			for each(var item:Object in itemArray){
					if(item!=null&&item.hasOwnProperty("regex")&&StringUtil.trim(item.regex)!==""){
						var regex:RegExp= RegExp(item.regex);
					  //if no pass
			 		  var result:Boolean = regex.test(item.text);
			 			if(!result){
			 				bool=false;
			 				item.setStyle("backgroundColor","#EBCED7");
						    validateTextInput(item);
						}else{
			 		    //pass
			 			item.setStyle("backgroundColor","#ffffff");
			 			}
				}
		 		
		 	}
		 	return bool;
		}
		//call this function after commit successfully
		public static var _completeHandler:Function;
		
		/**
		 * submit form
		 * @return true：pass, false：no pass
		 * @param arr：page data array
		 * */
		public static function submitForm(arr:ArrayCollection):Boolean{
			var bool:Boolean=validate();
		 	if(bool){
		 		submit(arr);
		 	}
		 	return bool;
		}
			
		/**
		 * submit form
		 * 
		 * @param arr
		 * @return 
		 */
		 public static function submit(arr:ArrayCollection):void{
			var ac:ArrayCollection=new ArrayCollection();
			var oc:Object= null;
			for (var i:int=0;i<itemArray.length;i++){
				//if the ComboBox
				oc = new Object();
				oc["id"]=itemArray[i].id;
				if(itemArray[i] is ComboBox){ 
					oc["text"]=itemArray[i].selectedLabel;
				}else{//TextInput or DataField
					oc["text"]=itemArray[i].text;
				}
				ac.addItem(oc);
			}

			var omodify:Object=new Object();
			omodify["id"]="last_modify_author";
			if(UserRight.getUserUUID() !=="777"){
				omodify["text"]=UserRight.getloginUserInfo().username;
			}else{
				omodify["text"]="superman";
			}
			ac.addItem(omodify);
			
			var odata:Object=new Object();
			var date1:Date=new Date();
			odata["id"]="last_modify_date_str";
			//piece together date in '/'
			odata["text"]=(date1.getMonth() + 1) +"/"+date1.getDate()+"/"+date1.getFullYear();
			ac.addItem(odata);
			
			for each(var oo:Object in arr){
				ac.addItem(oo);
			}
			//call java method
			var utmost:UtmostService=new UtmostService("InformationPublishService",_completeHandler);
			utmost.ro.addCommonDataWithUUID(ac);
				
 		
		}
		/**
		 * submit successfully
		 * 
		 * @param e
		 * @return 
		 */
		 public static function submitsuccess(e:ResultEvent):void{
				if(e.result){
					if(_completeHandler!==null){
						_completeHandler.call();
					}
				}else{
					//submit failure popup a message
					Alert.show("Failure to submit!!");
				}
		}
		/**
		 * listening text doesn't validate success
		 * 
		 * @param model
		 * @return
		 */
		public  static function validateTextInput(model:Object):void{
			model.addEventListener(Event.CHANGE,function ():void{
				if(match(model.text,RegExp(model.regex))){
					model.setStyle("backgroundColor","#ffffff");
				}
				else{
					model.setStyle("backgroundColor","#EBCED7");
				}
			});
		}
		/**
		 * regex
		 * 
		 * @param value
		 * @param regex
		 * @return Boolean
		 */
		public static  function match(value:String,regex:RegExp):Boolean{
			var result:Boolean = regex.test(value);
			return result;
		}
	}
}