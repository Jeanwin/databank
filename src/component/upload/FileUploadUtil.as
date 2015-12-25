package component.upload
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.*;
	/**
	 * file upload util function class
	 */
	public class FileUploadUtil
	{
		//refference files added
		private var _refAddFiles:Object;
		//Need upload file
		[ArrayElementType("String")]
		public var _arrRealyUploadFile:Array;
		//modify files array
		public var modifyFile:Array = new Array();
		
		private var date:Date=new Date();
        private var swfFile:Array = new Array(new FileFilter("SWF Files (*.swf;*.flv)","*.swf;*.flv"));
        private var pdfFile:Array = new Array(new FileFilter("PDF Files (*.pdf)",("*.pdf")));
        private var pdfAndswfFiles:Array = new Array(new FileFilter("PDF/SWF Files (*.pdf;*.swf;*.flv)","*.pdf;*.swf;*.flv"));
       	
       	/**
       	 * obtain real upload file array
       	 * 
       	 * @param 
	     * @return 
       	 */
        public function get arrRealyUploadFile():Array{
        	return _arrRealyUploadFile;
        }
        
       /**
        * only add attachment box, display attachment when modify info
        * 
        * @param currentVbox
        * @param fileName
        * @param fileKind
	    * @return 
        * */
        public function addFilesBox(currentVbox:VBox, fileName:String, fileKind:String):void{
			var hbox:HBox=new HBox();
				hbox.id=date.time.toString();
				hbox.horizontalScrollPolicy = "false";
				hbox.percentWidth = 100;
				hbox.toolTip = fileName;
				hbox.setStyle("horizontalAlign","left");
				
				var ft:String = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length);
				
				modifyFile.push({fr:null,name:fileName, size:1, file:null,kind:fileKind,type:ft});
				
			var label:Label=new Label();
				label.text = fileName;
			var clo_button:LinkButton=new LinkButton();
				clo_button.label="x";
				//Add onclick event, when click delete the reference:1.delete 2. delete in the Array
				clo_button.addEventListener(MouseEvent.CLICK,function():void{
					currentVbox.removeChild(hbox);
					var tempArr:Array=new Array();
					for(var i:Number=0; i < modifyFile.length; i++){
						if(modifyFile[i].kind===fileKind){
							trace(modifyFile[i].name);
							modifyFile[i]=null;
						}else{
							tempArr.push(modifyFile[i]);
						}
					}
					modifyFile=tempArr;
				});
			hbox.addChild(clo_button);
			hbox.addChild(label);
			if(ft === "pdf")
				hbox.states=["pdf"];
			currentVbox.addChild(hbox);
		}
        
        /**
        * remove all the files in the current vbox
        * 
        * @param currentVbox
	    * @return 
        * */
        public function removeFiles(currentVbox:VBox):void{
        	if(currentVbox.getChildren()!==null){
				var tempArr:Array= null;
        		for each(var item:Object in currentVbox.getChildren()){
        			var id = (item as HBox).id;
        			 tempArr=new Array();
					 for(var i:Number=0; i < _arrRealyUploadFile.length; i++){
					  if(_arrRealyUploadFile[i].tempid===id){
						_arrRealyUploadFile[i]=null;
					  }else{
						tempArr.push(_arrRealyUploadFile[i]);
					  }
					}
				   _arrRealyUploadFile=tempArr;
        		}
        	}
        	currentVbox.removeAllChildren();
        }
        
        /**
        * This function for add the new file to Hbox, and slected file save to _arrUploadFiles
		* 
        * @param currentHbox:the added new file display in the Hbox
        * */
        public   function addFiles(currentVbox:VBox):void{
			if(_arrRealyUploadFile===null){
				_arrRealyUploadFile=new Array();
			}
			if(currentVbox.getChildren().length===2){
				return;
			}
			_refAddFiles=new FileReference();
			_refAddFiles.addEventListener(Event.SELECT, function ():void{
				//after selected the submit file，
				var fr:FileReference=(_refAddFiles as FileReference);
				//put the user selected the file into collection
				var tempid:String=date.time.toString();
					_arrRealyUploadFile.push({fr:fr,tempid:tempid,name:fr.name, size:formatFileSize(fr.size), file:fr,kind:currentVbox.id,type:fr.type.toLowerCase()});
					// Each HBOX will be display a reference file, the file name after X
					var hbox:HBox=new HBox();
						hbox.id=tempid;
						date=new Date();
						hbox.setStyle("background-color","#FFFFFF");
					var label:Label=new Label();
						label.text=fr.name;
					var clo_button:LinkButton=new LinkButton();
						//close window button label
						clo_button.label="x";
						//Add onclick event, when click delete the reference:1.delete 2. delete in the Array
						clo_button.addEventListener(MouseEvent.CLICK,function():void{
							currentVbox.removeChild(hbox);
							var tempArr:Array=new Array();
							for(var i:Number=0; i < _arrRealyUploadFile.length; i++){
								trace(_arrRealyUploadFile[i].tempid+":::_arrRealyUploadFile[i].tempid");
								trace(hbox.id+":::hbox.id");
								if(_arrRealyUploadFile[i].tempid===hbox.id){
									trace(_arrRealyUploadFile[i].name);
									_arrRealyUploadFile[i]=null;
								}else{
									tempArr.push(_arrRealyUploadFile[i]);
								}
							}
							_arrRealyUploadFile=tempArr;
							
						});
					hbox.addChild(clo_button);
					hbox.addChild(label);
					if(fr.type.toLowerCase()===".pdf")
						hbox.states=["pdf"];
					currentVbox.addChild(hbox);
			});
			if(currentVbox.getChildren().length===0){
					_refAddFiles.browse(pdfAndswfFiles);
			}
			if(currentVbox.getChildren().length===1){
				var boxObj:HBox = currentVbox.getChildren()[0] as HBox;
				if(boxObj.states.toString()==="pdf"){
					_refAddFiles.browse(swfFile);
				}
				else{
					_refAddFiles.browse(pdfFile);
				}
			}
			
		}
		/**
		 * transfor file size format to new file size format we know
		 * 
		 * @param numSize
	     * @return String
		 * */
		private function formatFileSize(numSize:Number):String{
				var strReturn:String;
				numSize=Number(numSize / 1000);
				strReturn=String(numSize.toFixed(1) + " KB");
				if (numSize > 1000){
					numSize=numSize / 1000;
					strReturn=String(numSize.toFixed(1) + " MB");
					if (numSize > 1000){
						numSize=numSize / 1000;
						strReturn=String(numSize.toFixed(1) + " GB");
					}
				}
				return strReturn;
			}
		/**
		 * Constructor
		 * 
		 * @param 
	     * @return 
		 */
		public function FileUploadUtil(){
		    trace("Constructor function");
		}

	}
}