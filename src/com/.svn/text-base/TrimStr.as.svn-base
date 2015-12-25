package com
{
	/**
	 * remove spacer in string(mean left spacer or right spacer)
	 * 
	 * @Date 2015 Jan 27, 2015 15:34 PM
	 * */
	public class TrimStr
	{
		/**
		 * remove left spacer
		 * 
		 * @param s
		 * @return String
		 * */
		public static function LTrim(s:String):String{
			var i:Number=0;
			while (s.charCodeAt(i) === 32 || s.charCodeAt(i) === 13 || s.charCodeAt(i) === 10 || s.charCodeAt(i) === 9)
			{
				i++;
			}
			return s.substring(i, s.length);
		}
		/**
		 * remove right spacer
		 * 
		 * @param s
		 * @return String
		 * */
		public static  function RTrim(s:String):String{
			var i:Number=s.length - 1;
			while (s.charCodeAt(i) === 32 || s.charCodeAt(i) === 13 || s.charCodeAt(i) === 10 || s.charCodeAt(i) === 9){
				i--;
			}
			return s.substring(0, i + 1);
		}

		/**
		 * remove right and left spacer
		 * 
		 * @param s
		 * @return String
		 * */
		public static function Trim(s:String):String{
			return LTrim(RTrim(s));
		}

	}
}