package org.utmost.effect
{
	import flash.display.DisplayObject;
	
	import mx.core.IFlexDisplayObject;
	import mx.effects.Blur;
	import mx.events.TweenEvent;
	import mx.managers.PopUpManager;
	/**
	 * package PopUpManager effective in PopUpEffect
	 * */
	public class PopUpEffect
	{
		/**
		 * Constructor
		 */
		public function PopUpEffect(){
		     trace("the constructor function");
		}
		/**
		 * show popup window
		 * 
		 * @param  control
		 * @param  parent
		 * @param  modal
	     * @return 
		 */
		public static function show(control:IFlexDisplayObject, parent:DisplayObject, modal:Boolean=true):void{
			PopUpEffect.showByBlur(control,parent,modal);
		}
		/**
		 * remove popup window
		 * 
		 * @param  control
	     * @return 
		 */
		public static function remove(control:IFlexDisplayObject):void{
			PopUpEffect.removeByBlur(control);
		}
		/**
		 * show after blur
		 * 
		 * @param  control
		 * @param  parent
		 * @param  modal:default ture
	     * @return 
		 */
		public static function showByBlur(control:IFlexDisplayObject, parent:DisplayObject, modal:Boolean=true):void{
			var mShowEffect:Blur=new Blur();
			mShowEffect.blurXFrom=255;
			mShowEffect.blurYFrom=255;
			mShowEffect.blurXTo=0;
			mShowEffect.blurYTo=0;
			mShowEffect.target=control;
			mShowEffect.duration=300;
			PopUpManager.addPopUp(control, parent, modal);
			//popup a screen in windwo center
			PopUpManager.centerPopUp(control);
			//start play(excute effect)
			mShowEffect.play();
		}
		/**
		 * remove after blur
		 * 
		 * @param  control
	     * @return
		 */
		public static function removeByBlur(control:IFlexDisplayObject):void{
			PopUpManager.removePopUp(control);
		}
		/**
		 * test remove
		 * 
		 * @param  control
	     * @return
		 */
		public static function removeByTest(control:IFlexDisplayObject):void{
			var ect:Blur=new Blur();
			ect.blurXFrom=0;
			ect.blurYFrom=0;
			ect.blurXTo=255;
			ect.blurYTo=255;
			//add tweenEnd listener
			ect.addEventListener(TweenEvent.TWEEN_END, function():void{
					PopUpManager.removePopUp(control);
			});
			ect.duration=300;  //the duration of 300 milliseconds
			ect.target=control;	//component application of this effect
			//start play(execute effect)
			ect.play();
		}
	}
}

