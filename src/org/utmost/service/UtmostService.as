package org.utmost.service
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.core.Application;
	import mx.utils.URLUtil;
	

	/**
	 * Packaging remote object service
	 * */
	public class UtmostService
	{
		import mx.collections.ArrayCollection;
		import mx.controls.Alert;
		import mx.core.Container;
		import mx.rpc.events.FaultEvent;
		import mx.rpc.events.ResultEvent;
		import mx.rpc.remoting.mxml.RemoteObject;
		//new a RemoteObject for remote calling java method
		public var ro:RemoteObject=new RemoteObject();
		/**
		 * Constructor function, implement channel ,destination and so on, 
		 * you can call java method
		 * 
		 * @param destination
		 * @param _resultHandler:default null
		 * @param _faultHandler
		 * @return 
		 */
		public function UtmostService(destination:String, _resultHandler:Function=null, _faultHandler:Function=null){
			ro.channelSet=StaticChannelSet.getChannelSet();//get channel sets
			//corresponding java spring id
			ro.destination=destination;
			ro.showBusyCursor=true;
			if (_resultHandler != null){
				ro.addEventListener(ResultEvent.RESULT, _resultHandler);	//add listener
			}else{
				ro.addEventListener(ResultEvent.RESULT, resultHandler);	//add listener
			}
			if (_faultHandler != null){
				ro.addEventListener(FaultEvent.FAULT, _faultHandler);	//add listener
			}else{
				ro.addEventListener(FaultEvent.FAULT, faultHandler);	//add listener
			}

		}
		/**
		 * handle result
		 * 
		 * @param event
		 * @return 
		 */
		private function resultHandler(event:ResultEvent):void{
			trace("UtmostService->resultHandler->" + event.result);
		}
		/**
		 * fault handle
		 * 
		 * @param event
		 * @return
		 */
		private function faultHandler(event:FaultEvent):void{
			trace("UtmostService->faultHandler->" + event.fault + "-->" + event.currentTarget);
			if(event.fault.faultCode == "Client.Error.MessageSend"){
				var urlRequest:URLRequest = new URLRequest(getUrlRoot());
				navigateToURL(urlRequest, "_self");
				return;
			}
			Alert.show("不可接受的操作");
		}
		/**
		 * Intercept url string
		 * 
		 * @param 
		 * @return String
		 */
		private function getUrlRoot():String{
			var url:String = Application.application.url;
			var fullURL:String = URLUtil.getFullURL(url, url);
			return fullURL.substr(0, fullURL.indexOf("/vw/"));
		}
	}
}

