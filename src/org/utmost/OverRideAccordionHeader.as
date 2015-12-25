package org.utmost
 { 
	import mx.containers.accordionClasses.AccordionHeader; 

	public class OverRideAccordionHeader extends AccordionHeader 
	{ 
		/**
		 * Constructor
		 * 
		 * @param 
		 * @return 
		 */
		public function OverRideAccordionHeader(){ 
			//extends father structure function
			super(); 
			//set mouse enable
			mouseEnabled = false; 
		} 
	} 
}
