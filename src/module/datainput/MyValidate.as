package module.datainput
{
	import mx.controls.TextInput;
	/**
	 * validate function class
	 */
	public class MyValidate
	{
		/**
		 * validate textinput, params: obj validated, error alert info, pass or not
		 * 
		 * @param o
		 * @param tootip
		 * @param state
	     * @return
		 */
		public static function  validateTextInput(o:Object,tootip:String,state:Boolean):void{
				if(state==false){
					o.setStyle("backgroundColor","#EBCED7");
		 			o.toolTip=tootip;
				}else{
					o.setStyle("backgroundColor","#ffffff");
		 			o.toolTip=o.text;
				}
		}
		/**
		 * validate combobox, params: obj validated, error alert info, pass or not
		 * 
		 * @param o
		 * @param tootip
		 * @param state
	     * @return
		 */
		public static function  validateCombobox(o:Object,tootip:String,state:Boolean):void{
			if(state==false){
					o.setStyle("fillColors","#EBCED7,#EBCED7");
		 			o.toolTip=tootip;
				}else{
					o.setStyle("fillColors","#ffffff,#ffffff");
		 			o.toolTip=o.text;
				}
		}
		public function MyValidate(){}

	}
}