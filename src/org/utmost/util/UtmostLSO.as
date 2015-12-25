package org.utmost.util
{
	import flash.events.NetStatusEvent;
	import flash.net.SharedObject;
	import flash.net.SharedObjectFlushStatus;
	import flash.net.registerClassAlias;
	
	import org.utmost.util.UtmostLSOBean;
	
	public class UtmostLSO
	{
		//share object
		private var lso:SharedObject;
		/**
		 * save lso
		 * 
		 * @param obj
		 * @return 
		 */
		public function saveLSO(obj:UtmostLSOBean):void {
			flash.net.registerClassAlias("org.utmost.lso.UtmostLSOBean",UtmostLSOBean);
			lso=SharedObject.getLocal("utmost");
			lso.data.UtmostLSOBean=obj;
			try {
				var flashResult:String=lso.flush();
				if(flashResult==SharedObjectFlushStatus.PENDING) {
					trace("allow save");
					lso.addEventListener(NetStatusEvent.NET_STATUS,onStatus);
				}else if(flashResult==SharedObjectFlushStatus.FLUSHED) {
					trace("save finish");			
				}else {
					trace(flashResult+"未知");
				}
			}catch(e:Error) {
				trace(e.message);
			}
		}
		/**
		 * remove listener event
		 * 
		 * @param e
		 * @return 
		 */
		public function onStatus(e:NetStatusEvent):void {
			trace(e.info.code);
			if(e.info.code=="SharedObject.Flush.Success") {
				trace(e.info.code);
			}else if(e.info.code=="SharedObject.Flush.Failed") {
				trace(e.info.code);
			}
			lso.removeEventListener(NetStatusEvent.NET_STATUS,onStatus);
		}
		/**
		 * obtain default object
		 * 
		 * @param 
		 * @return Object
		 */
		public function defaultObj():Object {
			lso=SharedObject.getLocal("utmost");
			return lso.data.UtmostLSOBean;
		}
	}
}