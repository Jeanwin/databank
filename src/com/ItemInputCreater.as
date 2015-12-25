package com
{
	import mx.containers.HBox;
	import mx.controls.Button;
	import mx.controls.Label;
	import mx.controls.TextInput;
	/**
	 * ItemInputCreater
	 */
	public class ItemInputCreater
	{	
		
		//Item title
		private var labelStr:String;
		
		/**
		 * Object constructor
		 * @param labelStr item title
		 * */
		public function ItemInputCreater(labelStr:String){
			this.labelStr = labelStr;
		}
		
		/**
		 * obtain HBox
		 * 
		 * @param
		 * @return HBox
		 * */
		public function getBasicBox():HBox{
			
			var box:HBox = new HBox(); //main in inputting item
			box.percentWidth = 100;
			box.height = 39;
			
			var label:Label = new Label();
			label.percentWidth = 20;
			label.text = labelStr;
			box.addChild(label);
			
			var input:TextInput = new TextInput();
			input.percentWidth = 60;
			box.addChild(input);
			
			return box;
		}
		
		/**
		 * obtain HBox obj having attachment
		 * 
		 * @param
		 * @return HBox
		 * */
		public function getUploadInputBox():HBox{
			
			var box:HBox = new HBox(); //main in inputting item
			box.percentWidth = 100;
			box.height = 39;
			
			var label:Label = new Label();
			label.percentWidth = 20;
			label.text = labelStr;
			box.addChild(label);
			
			var input:TextInput = new TextInput();
			input.percentWidth = 39;
			box.addChild(input);
			
			var button:Button = new Button();
			button.label = "    上传附件";
			box.addChild(button);
			
			return box;
		}
	}
}