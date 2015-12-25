package org.utmost.mycomponents
{
    /*
      style：
      color: font color 
      textDecoration: underline（NO：normal,Yes:underline）
      textRollOverColor: the color when the Mouseover
      textSelectedColor: the font color when the mouse press or selected.
    */
   
    import flash.events.MouseEvent;
    
    import mx.controls.Label;
    import mx.controls.LinkButton;
 	/**
 	 * button function class
 	 */
    public class Components_LinkButton extends LinkButton
    {
      //linkButton icon
      //type of variable should be Class
      [Embed('/img/buttonicon/search_bottom.png')]
      private const bottomLinkButton:Class;   //icon is bottom arrow(two arrows)
      
      [Embed('/img/buttonicon/search_left.png')]
      private const leftLinkButton:Class;	//icon is left arrow(two arrows)
      
      [Embed('/img/buttonicon/search_right.png')]
      private const rightLinkButton:Class;	//icon is right arrow(two arrows)
      
      [Embed('/img/buttonicon/search_up.png')]
      private const upLinkButton:Class;		//icon is up arrow(two arrows)
      
      [Embed('/img/buttonicon/nextpage_button.png')]
      private const nextLinkButton:Class;	//icon is right arrow(one arrow)
      
      [Embed('/img/buttonicon/prevpage_button.png')]
      private const prevLinkButton:Class;	//icon is left arrow(one arrow)
      //different iconType display different icon
      //type of iconType contains 'bottom','left','right','up','next','prev'
      public var iconType:String;
       /**
       * Constructor
       * 
       * @param  
	   * @return 
       */
       public function Components_LinkButton(){
           super();
           //linkButton will be call to add icon button function after init.
            callLater(subIcon);
       }
       /**
       * set icon
       * different the type of icon has different style icon
       * @param  
	   * @return
       */
       private function subIcon():void{
           	switch(iconType){
           		case "bottom":  
			       super.setStyle("icon",bottomLinkButton);	//botton arrows(two arrows)
			        break;  
			    case "left":  
			        super.setStyle("icon",leftLinkButton);  //left arrow(two arrows)
			        break;  
			    case "right":  
				    super.setStyle("icon",rightLinkButton);	//right arrow(two arrows)
				    break;  
			    case "up":  
				    super.setStyle("icon",upLinkButton);	//up arrow(two arrows)
				    break;
				case "next":  
				    super.setStyle("icon",nextLinkButton);	//right arrow(one arrow)
				    break;
				case "prev":  
				    super.setStyle("icon",prevLinkButton);	//left arrow(one arrow)
				    break;  
			  	default: 
           }
       }
       /**
       * The mouse suspended on the word
       * 
       * @param  event
	   * @return
       */
       override protected function rollOverHandler(event:MouseEvent):void{
           super.rollOverHandler(event);
       }
        /**
       * when mouse down
       * 
       * @param  event
	   * @return
       */
       override protected function mouseDownHandler(event:MouseEvent):void {
           super.mouseDownHandler(event);
       }
        /**
       * when mouse up
       * 
       * @param  event
	   * @return
       */
       override protected function mouseUpHandler(event:MouseEvent):void{
           super.mouseUpHandler(event);
       }
        /**
       * when mouse roll out
       * 
       * @param  event
	   * @return
       */
       override protected function rollOutHandler(event:MouseEvent):void{
           super.rollOutHandler(event);
       }
 
    }
}