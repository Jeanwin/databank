package assets.programmatic
{
	import mx.controls.DateField;

	public class MyDateField extends DateField
	{
		public function MyDateField()
		{
			super();
		}
		/**
		 * update Display List
		 * 
		 * @param unscaledWidth
		 * @param unscaledHeight
		 */
		override protected function updateDisplayList(unscaledWidth:Number,
                                                  unscaledHeight:Number):void
	    {
	        super.updateDisplayList(unscaledWidth, unscaledHeight);
	
	       
	        textInput.setActualSize(textInput.width+2, textInput.height);
	    }
		
	}
}