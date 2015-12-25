package com{
	public class Validator{
		/**
		 * judge value of string is null or empty(is null or empty return true)
		 * 
		 * @param str
		 * @return Boolean
		 * */
		public static function isNullOrEmpty(str:String):Boolean{
			if(isNull(str)){
				return true;
			}else{
				var ss:String = TrimStr.Trim(str);
				if(ss === ""){
					return true;
				}else{
					return false;
				}
			}
		}
		/**
		 * judge value of string is null or empty(is null or empty return false)
		 * 
		 * @param str
		 * @return Boolean
		 * */
		public static function notNullAndEmpty(str:String):Boolean{
			if(isNull(str)){
				return false;
			}else{
				var ss:String = TrimStr.Trim(str);
				if(ss === ""){
					return false;
				}else{
					return true;
				}
			}
		}
		
		/**
		 * is null return true
		 * 
		 * @param obj
		 * @return Boolean
		 * */
		public static function isNull(obj:Object):Boolean{
			return obj === null;
		}
		
	}
}