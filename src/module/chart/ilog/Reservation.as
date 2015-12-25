///////////////////////////////////////////////////////////////////////////////
// Licensed Materials - Property of IBM
// 5724-Y31
// (c) Copyright IBM Corporation 2007, 2009. All Rights Reserved.
//
// Note to U.S. Government Users Restricted Rights:
// Use, duplication or disclosure restricted by GSA ADP Schedule
// Contract with IBM Corp.
///////////////////////////////////////////////////////////////////////////////

package module.chart.ilog
{
  [Bindable]
  /**
   * Value Object for reservations.
   * A reservation corresponds to the reservation of a resource for the 
   * processing of a task.
   */
  public class Reservation
  {
    public var resourceId:String;
    public var taskId:String;

    public function Reservation()
    {
    }

  }
}
