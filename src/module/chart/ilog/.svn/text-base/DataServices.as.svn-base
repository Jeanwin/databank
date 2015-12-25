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
  import ilog.gantt.ConstraintKind;
  
  import mx.collections.ArrayCollection;
  import mx.collections.HierarchicalCollectionView;
  import mx.collections.HierarchicalData;
  
  /**
   * Singleton class providing the data services.
   */
  public class DataServices
  {
    //
    //  Singleton
    //

    private static var _instance:DataServices;
    
    public static function getInstance():DataServices
    {
      if (!_instance)
      {
        _instance = new DataServices();
      }
      return _instance;
    }
    

    //
    //  Variables
    //

    private var taskArrayCollection:ArrayCollection;

    //
    //  Properties
    //

    public var taskCollection:HierarchicalCollectionView;
    public var constraintCollection:ArrayCollection;
    public var resourceCollection:ArrayCollection;
    public var reservationCollection:ArrayCollection;


  	/**
	 * fill
	 * 
	 * @param source
     * @return
	 */
    public function fill(source:XML):void
    {
      taskArrayCollection = new ArrayCollection();
      fillTasks(source.activities.activity, taskArrayCollection);
      
      var taskHierarchicalData:HierarchicalData = new HierarchicalData(taskArrayCollection);
      taskCollection = new HierarchicalCollectionView(taskHierarchicalData);

      constraintCollection = new ArrayCollection();      
      fillConstraints(source.constraints.constraint, constraintCollection);
      
      resourceCollection = new ArrayCollection();
      fillResources(source.resources.resource, resourceCollection);
      
      reservationCollection = new ArrayCollection();
      fillReservations(source.reservations.reservation, reservationCollection);
    }
    

    //
    //  Task services
    //

    private function fillTasks(source:XMLList,
                               collection:ArrayCollection):void
    {
      for each (var e:XML in source)
      {
        var i:Task = new Task();
  
        i.id = String(e.@id);
        i.name = String(e.@name);
        i.info = String(e.@info);
        i.startTime = new Date(String(e.@start));
        i.endTime = new Date(String(e.@end));
        i.milestone = e.hasOwnProperty("@milestone") 
                         ? new Boolean(String(e.@milestone))
                         : false;
        var childrenElements:XMLList = e.children();
        if (childrenElements.length() > 0)
        {
          i.children = new ArrayCollection();
          fillTasks(e.children(), i.children);
        }
         
        collection.addItem(i);
      }
    }
	/**
	 * get Task By Id
	 * 
	 * @param id
     * @return Task
	 */
    public function getTaskById(id:String):Task
    {
      return getTaskByIdImpl(id, taskArrayCollection);
    }
    //get Task By Id Impl
    private function getTaskByIdImpl(id:String, collection:ArrayCollection):Task
    {
      for each (var i:Task in collection)
      {
        if (i.id == id)
        {
          return i;
        }
        if (i.children)
        {
          var l:Task = getTaskByIdImpl(id, i.children);
          if (l)
          {
            return l;
          }
        }
      }
      
      return null;
    }
    /**
	 * delete Task
	 * 
	 * @param task
     * @return Boolean
	 */
    public function deleteTask(task:Task):Boolean
    {
      return deleteTaskImpl(task, taskArrayCollection);
    }
    //delete Task Impl
    private function deleteTaskImpl(task:Task, collection:ArrayCollection):Boolean
    {
      var index:int = collection.getItemIndex(task);
      if (index >= 0)
      {
        collection.removeItemAt(index);
        return true;
      }
      else
      {
        for each (var i:Task in collection)
        {
          if (i.children && deleteTaskImpl(task, i.children))
          {
            return true;
          }
        }
      }
      return false;
    }
    /**
	 * get Resources For Task
	 * 
	 * @param task
     * @return Array
	 */
    public function getResourcesForTask(task:Task):Array
    {
      var resources:Array = [];

      for each (var i:Reservation in reservationCollection)
      {
        if (i.taskId == task.id)
        {
          resources.push(getResourceById(i.resourceId));
        }
      }

      return resources;
    }

    //
    //  Constraint services
    //

    private function fillConstraints(source:XMLList, 
                                     collection:ArrayCollection):void
    {
      for each (var e:XML in source)
      {
        var i:Constraint = new Constraint();
        
        i.fromId = String(e.@from);
        i.toId = String(e.@to);
        i.kind = getConstraintKind(String(e.@type));
        
        collection.addItem(i);
      }
    }
  	//get Constraint Kind
    private function getConstraintKind(type:String):String
    {
      switch (type)
      {
        case "Start-Start": return ConstraintKind.START_TO_START;
        case "Start-End": return ConstraintKind.START_TO_END;
        case "End-Start": return ConstraintKind.END_TO_START;
        case "End-End": return  ConstraintKind.END_TO_END;
      }
      return ConstraintKind.END_TO_START;
    } 
	/**
	 * delete Constraint
	 * 
	 * @param constraint
     * @return 
	 */
    public function deleteConstraint(constraint:Constraint):void
    {
      var index:int = constraintCollection.getItemIndex(constraint);
      if (index >= 0)
      {
        constraintCollection.removeItemAt(index);
      }
    }
    
    //
    //  Resource services
    //
	//fill Resources
    private function fillResources(source:XMLList, 
                                   collection:ArrayCollection):void
    {
      for each (var e:XML in source)
      {
        var i:Resource = new Resource();
        
        i.id = String(e.@id);
        i.name = String(e.@name);
        i.quantity = Number(e.@quantity);
        
        collection.addItem(i);
      }
    }
	/**
	 * get Resource By Id
	 * 
	 * @param id
     * @return Resource
	 */
    public function getResourceById(id:String):Resource
    {
      for each (var i:Resource in resourceCollection)
      {
        if (i.id == id)
        {
          return i;
        }
      }
      return null;
    }
    
    //
    //  Reservation services
    //
	//fill Reservations
    private function fillReservations(source:XMLList, 
                                      collection:ArrayCollection):void
    {
      for each (var e:XML in source)
      {
        var i:Reservation = new Reservation();
        
        i.resourceId = String(e.@resource);
        i.taskId = String(e.@activity);
        
        collection.addItem(i);
      }
    }
  }
}
