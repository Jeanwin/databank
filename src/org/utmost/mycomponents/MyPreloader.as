package org.utmost.mycomponents
{
	import flexlib.controls.tabBarClasses.SuperTab;

	import mx.preloaders.DownloadProgressBar;
	/**
	 * preloader function class
	 */
	public class MyPreloader extends DownloadProgressBar
	{
		/**
		 * display preloader info
		 * 
		 * @param  
		 * @return 
		 */
		public function MyPreloader(){
			super();
			//display Loading
			downloadingLabel="Loading...";
			//display Initiating
			initializingLabel="Initiating......";
		}
	}
}

