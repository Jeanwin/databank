package org.utmost.util
{
	import mx.collections.ArrayCollection;
	import mx.controls.MenuBar;
	/**
	 * change language function class
	 */
	public  class ChangeLanguage
	{
		/**
		 * change menubar language, need params:menubar, field of menubar, and data source of menubar
		 * 
		 * @param o
		 * @param label
		 * @param data
		 * @return 
		 */
		public static function menuBar(o:MenuBar,label:String,data:ArrayCollection):void{
			o.labelField=label;
			o.dataProvider=data;
		}

	}
}