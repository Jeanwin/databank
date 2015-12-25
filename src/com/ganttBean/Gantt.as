package com.ganttBean
{
	import mx.collections.ArrayCollection;
	
	public class Gantt
	{
		public var _startYear:int;	//gantt start year
		public var _startMouth:int;	//gantt start month
		public var _startDay:int;	//gantt start day
		public var _endYear:int;	//gantt end year
		public var _endMouth:int;	//gantt end month
		public var _endDay:int;		//gantt end day
		public var _dayAmount:int;	//amount day
		public var _stageList:ArrayCollection;	//stage info put here
		//start date
		public var _startDate:Date;
		public var _endDate:Date;	//end date
		 
		/**
		 * Gantt object Constructor
		 * 
		 * @param startYear: plan start year
		 * @param startMouth: plan start month
		 * @param endYear: plan end year
		 * @param endMouth: plan end month
		 * */
		public function Gantt(startYear:int,startMouth:int,startDay:int,endYear:int,endMouth:int,endDay:int,stageList:ArrayCollection,startDate:Date,endDate:Date){
			_startYear = startYear;
			_startMouth = startMouth;
			_startDay = startDay;
			_endYear = endYear;
			_endMouth = endMouth;
			_endDay = endDay;
			_stageList = stageList;
			_startDate = startDate;
			_endDate = endDate;
		}
		
		

	}
}