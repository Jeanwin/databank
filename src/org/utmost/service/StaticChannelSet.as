package org.utmost.service
{
	import mx.core.Application;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	/**
	 * channel set function class
	 */
	public class StaticChannelSet
	{
		private static var uri:String=null; //uri put here
		private static var address:String=null;	//address put here
		//set uri
		public static  function setUri(_uri:String):void {
			uri=_uri;
		}
		//get uri
		public static  function getUri():String {
			return uri;
		}
		//set address
		public static function setAddress(_address:String):void {
			address=_address;
		}
		//get address
		public static function getAddress():String {
			return address;
		}
		/**
		 * obtain channel sets
		 * 
		 * @param 
		 * @return ChannelSet
		 */
		public static function getChannelSet():ChannelSet {
			var channelSet:ChannelSet = new ChannelSet();
			var amfChannel:AMFChannel = new AMFChannel("spring-amf", uri);
			amfChannel.pollingEnabled = true;	//open polling
			amfChannel.pollingInterval = 2000;	//set polling time 2000 milliseconds
			channelSet.addChannel(amfChannel);
			return channelSet;
		}
		/**
		 * Intercept url string
		 * 
		 * @param 
		 * @return String
		 */
		public static function getWebRoot():String{
			var currentUrl:String = Application.application.url;
			return currentUrl.substr(0, currentUrl.indexOf("/vw/"));
		}
	}
}