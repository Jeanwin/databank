package org.utmost.util
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import mx.core.Container;
	/**
	 * shortcut key util function class
	 */
	public class ShortcutKeyUtil
	{

		/**
		 * press enter key
		 * 
		 * @param container
		 * @param func:call function
		 * @return 
		 */
		public static function setFocusAndSubmit(container:Container, func:Function):void{
			//Enter number code
			ShortcutKeyUtil.setShortcutKey(container,13,func);
		}
		/**
		 * press esc key
		 * 
		 * @param container
		 * @param func:call function
		 * @return 
		 */
		public static function setFocusAndCancel(container:Container, func:Function):void{
			//ESC number code
			ShortcutKeyUtil.setShortcutKey(container,27,func);
		}
		/**
		 * press del key
		 * 
		 * @param container
		 * @param func:call function
		 * @return 
		 */
		public static function setFocusAndDelete(container:Container, func:Function):void{
			//Delete number code
			ShortcutKeyUtil.setShortcutKey(container,127,func);
		}
		/**
		 * shortcut key call function
		 * 
		 * @param container
		 * @param charCode:key code
		 * @param func:call function
		 * @return 
		 */
		public static function setShortcutKey(container:Container, charCode:int, func:Function):void{
			container.setFocus();
			container.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void
				{
					if (e.charCode == charCode) {
						e.preventDefault();
						func.call();
					}
			});
		}
		/**
		 * Simulation press enter
		 * auto press enter key
		 * 
		 * @param e
		 * @param focusManage
		 * @return
		 */
		public static function autoCompleteEnter(e:KeyboardEvent,focusManage:Object):void {
				if(e.keyCode==Keyboard.ENTER) {
					focusManage.getNextFocusManagerComponent().setFocus();
					e.preventDefault();
				}
		}
	}
}

