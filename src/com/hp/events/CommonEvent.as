package com.hp.events
{
	import flash.events.Event;
	/**
	 * define some event string constant
	 * */
	public dynamic class CommonEvent extends Event
	{
		//change language event constant
		public static const TOGGLE_LANGUAGE_EVENT:String = "TOGGLE_LANGUAGE_EVENT";
		//tree and menu data providor change
		public static const PANEL_TREE_MENU_DATA_PROVIDOR_CHANGE:String = "PANEL_TREE_MENU_DATA_PROVIDOR_CHANGE";
		//notice download file string
		public static const NOTICE_DOWNLOAD_FILE:String = "NOTICE_DOWNLOAD_FILE";
		//forum search
		public static const FORUM_SEARCH_EVENT:String = "FORUM_SEARCH_EVENT";
		//go category list
		public static const GO_CATEGORY_LIST_EVENT:String = "GO_CATEGORY_LIST_EVENT";
		//go topic list
		public static const GO_TOPIC_LIST_EVENT:String = "GO_TOPIC_LIST_EVENT";
		//go topic detail
		public static const GO_TOPIC_DETAIL_EVENT:String = "GO_TOPIC_DETAIL_EVENT";
		//send parameter
		public static const SEND_PARAMETER_EVENT:String = "SEND_PARAMETER_EVENT";
		//post change
		public static const POST_CHANGED_EVENT:String = "POST_CHANGED_EVENT";
		//search directory
		public static const SEARCH_DIRECTORY_SELECTED:String = "SEARCH_DIRECTORY_SELECTED";
		/**
		 * Construtor
		 * 
		 * @param type
		 * @param bubbles
		 * @param cancelable
		 * @return
		 */
		public function CommonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			//call father constructor
			super(type, bubbles, cancelable);
		}
		
	}
}