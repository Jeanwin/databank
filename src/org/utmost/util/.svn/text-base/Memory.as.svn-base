package org.utmost.util
{
	import flash.net.LocalConnection;
	import flash.system.System;
	/**
	 * Memory manage function class
	 */
	public class Memory
	{


		public static function gc():void{
			try{
				new LocalConnection().connect('foo');
				new LocalConnection().connect('foo');
			}catch(e:*){
			  trace(e);
			}
		}
		/**
		 * obtain memory used number
		 * 
		 * @param
		 * @return Number
		 */
		public static function get used():Number{
			//Get memory display total
			return System.totalMemory;
		}
	}
}

