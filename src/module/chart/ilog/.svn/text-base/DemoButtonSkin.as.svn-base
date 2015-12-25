///////////////////////////////////////////////////////////////////////////////
// Licensed Materials - Property of IBM
// 5724-Y31
// (c) Copyright IBM Corporation 2007, 2009. All Rights Reserved.
//
// Note to U.S. Government Users Restricted Rights:
// Use, duplication or disclosure restricted by GSA ADP Schedule
// Contract with IBM Corp.
///////////////////////////////////////////////////////////////////////////////

package
{

  import flash.display.GradientType;
  
  import mx.core.IButton;
  import mx.core.UIComponent;
  import mx.skins.Border;
  import mx.skins.halo.HaloColors;
  import mx.styles.StyleManager;
  import mx.utils.ColorUtil;

  public class DemoButtonSkin extends Border
  {
    public function DemoButtonSkin()
    {
      super();
    }
    /**
	 * update Display List
	 * 
	 * @param w
	 * @param h
     * @return 
	 */
    override protected function updateDisplayList(w:Number, h:Number):void
    {
      super.updateDisplayList(w, h);

      var borderColor:uint = 0xDDDDDD;
      var cornerRadius:Number = getStyle("cornerRadius");
      var fillAlphas:Array = getStyle("fillAlphas");
      var fillColors:Array = getStyle("fillColors");
      var highlightAlphas:Array = getStyle("highlightAlphas");                                
      var themeColor:uint = getStyle("themeColor");


      var borderColorDrk1:Number =
        ColorUtil.adjustBrightness2(borderColor, -50);
      var cr:Number = Math.max(0, cornerRadius);
      var cr1:Number = Math.max(0, cornerRadius - 1);

      graphics.clear();

      switch (name)
      {                       
      case "overSkin":
        {

          drawRoundRect(
                        0, 0, w, h, cr,
                        [ borderColor, borderColorDrk1 ], 1,
                        verticalGradientMatrix(0, 0, w, h ),
                        GradientType.LINEAR, null, 
          { x: 1, y: 1, w: w - 2, h: h - 2, r: cornerRadius - 1 }); 
  
          drawRoundRect(
                        1, 1, w - 2, (h - 2) / 2,
          { tl: cr1, tr: cr1, bl: 0, br: 0 },
                        [ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
                        verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2)); 

          break;
        }
      case "downSkin":
      case "selectedDownSkin":
        {
          drawRoundRect(
                        0, 0, w, h, cr,
                        [ borderColor, borderColorDrk1 ], 1,
                        verticalGradientMatrix(0, 0, w, h ),
                        GradientType.LINEAR, null, 
          { x: 1, y: 1, w: w - 2, h: h - 2, r: cornerRadius - 1 }); 

          // button fill
          drawRoundRect(
                        1, 1, w - 2, h - 2, cr1,
                        [ 0xFFFFFF, 0xFFFFFF], 0.3,
                        verticalGradientMatrix(1, 1, w - 2, h - 2)); 
  
          drawRoundRect(
                        1, 1, w - 2, (h - 2) / 2,
          { tl: cr1, tr: cr1, bl: 0, br: 0 },
                        [ 0xFFFFFF, 0xFFFFFF ], highlightAlphas,
                        verticalGradientMatrix(1, 1, w - 2, (h - 2) / 2)); 
          break;
        }
      }
    }
  }
}
