package org.utmost.service
{
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.Container;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	import mx.utils.URLUtil;
	
	import org.utmost.util.AutoUtil;
	/**
	 * auto call AutoService
	 * */
	public class AutoService
	{
		//Remote object:use this ro to call remote java method
		private var ro:RemoteObject=new RemoteObject();
		/**
		 * get autoservice instance to direct call remote java method
		 * 
		 * @param  bool
		 * @return AutoService
		 */
		public static function  getInstance(bool:Boolean=true):AutoService {
			return new AutoService(bool);
		}
		/**
		 * class autoservice structure, set default destination 'AutoService', 
		 * call getinstance to call method in java class AutoService
		 * 
		 * @param  bool
		 * @return 
		 */
		public function AutoService(bool:Boolean=true){
			ro.channelSet=StaticChannelSet.getChannelSet();//caution
			ro.destination="AutoService";		//default set destination 'AutoService'
			ro.showBusyCursor=bool;
			//add listener event, event name string 'fault' for calling faultHandler
			//event name string 'result' for calling resultHandler
			ro.addEventListener(FaultEvent.FAULT, faultHandler);
			ro.addEventListener(ResultEvent.RESULT, resultHandler);
		}

		/**
		 * save or update
		 * 
		 * @param  entityName
		 * @param  obj
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function saveOrUpdate(entityName:String, obj:Object, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.saveOrUpdate.addEventListener(ResultEvent.RESULT, resultHandler);  //for save or update bind listener
			if (faultHandler != null)
				ro.saveOrUpdate.addEventListener(FaultEvent.FAULT, faultHandler);	//for save or update bind listener
			ro.saveOrUpdate(entityName, obj); // execute save or update
		}
		/**
		 * save or update all
		 * 
		 * @param  entityName
		 * @param  obj
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function saveOrUpdateAll(entityName:String, obj:Object, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.saveOrUpdateAll.addEventListener(ResultEvent.RESULT, resultHandler); //for save or update all bind listener
			if (faultHandler != null)
				ro.saveOrUpdateAll.addEventListener(FaultEvent.FAULT, faultHandler); //for save or update all bind listener
			ro.saveOrUpdateAll(entityName, obj); // execute save or update all
		}
		/**
		 * save
		 * 
		 * @param  entityName
		 * @param  obj
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function save(entityName:String, obj:Object, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.save.addEventListener(ResultEvent.RESULT, resultHandler);  //for save  bind listener
			if (faultHandler != null)
				ro.save.addEventListener(FaultEvent.FAULT, faultHandler); //for save  bind listener
			ro.save(entityName, obj); // execute save
		}
		
		/**
		 * save function right by func
		 * 
		 * @param  entityName
		 * @param  obj
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function saveFuncRightByFunc(entityName:String, obj:Object, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.saveFuncRightByFunc.addEventListener(ResultEvent.RESULT, resultHandler); //for save  bind listener
			if (faultHandler != null)
				ro.saveFuncRightByFunc.addEventListener(FaultEvent.FAULT, faultHandler); //for save  bind listener
			ro.saveFuncRightByFunc(entityName, obj);  // execute save
		} 

		/**
		 * save all
		 * 
		 * @param  entityName
		 * @param  obj
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function saveAll(entityName:String, obj:ArrayCollection, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.saveAll.addEventListener(ResultEvent.RESULT, resultHandler);//for save all bind listener
			if (faultHandler != null)
				ro.saveAll.addEventListener(FaultEvent.FAULT, faultHandler);	//for save all bind listener
			ro.saveAll(entityName, obj);// execute save all
		}


		/**
		 * auto save
		 * 
		 * @param  entityName
		 * @param  container
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function autoSave(entityName:String, container:Container, resultHandler:Function=null, faultHandler:Function=null):void{
			var obj:Object=AutoUtil.findValue(container);
			this.save(entityName, obj, resultHandler, faultHandler);
		}
		/**
		 * auto save or update
		 * 
		 * @param  entityName
		 * @param  container
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function autoSaveOrUpdate(entityName:String, container:Container, resultHandler:Function=null, faultHandler:Function=null):void{
			var obj:Object=AutoUtil.findValue(container);
			this.saveOrUpdate(entityName, obj, resultHandler, faultHandler);
		}

		/**
		 * update
		 * 
		 * @param  entityName
		 * @param  container
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function update(entityName:String, obj:Object, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.update.addEventListener(ResultEvent.RESULT, resultHandler);	//for update bind listener
			if (faultHandler != null)
				ro.update.addEventListener(FaultEvent.FAULT, faultHandler);	//for update bind listener
			ro.update(entityName, obj);	// execute update
		}
		/**
		 * update all
		 * 
		 * @param  entityName
		 * @param  container
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function updateAll(entityName:String, obj:ArrayCollection, resultHandler:Function=null, faultHandler:Function=null):void{
			if(obj==null||obj.length==0){
				return;
			}
			if (resultHandler != null)
				ro.updateAll.addEventListener(ResultEvent.RESULT, resultHandler);	//for update all bind listener
			if (faultHandler != null)
				ro.updateAll.addEventListener(FaultEvent.FAULT, faultHandler);	//for update all bind listener
			ro.updateAll(entityName, obj);	// execute update all
		}
		/**
		 * auto update
		 * 
		 * @param  entityName
		 * @param  container
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function autoUpdate(entityName:String, container:Container, resultHandler:Function=null, faultHandler:Function=null):void{
			var obj:Object=AutoUtil.findValue(container);
			this.update(entityName, obj, resultHandler, faultHandler);
		}

		/**
		 * find by uuid
		 * 
		 * @param  tableName
		 * @param  uuid
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function findByUUID(tableName:String, uuid:String, resultHandler:Function, faultHandler:Function=null):void{
			if (faultHandler != null)
				ro.findByUUID.addEventListener(FaultEvent.FAULT, faultHandler);		//for find bind listener

			ro.findByUUID.addEventListener(ResultEvent.RESULT, resultHandler);	//for find bind listener
			ro.findByUUID(tableName, uuid);	//execute find
		}

		/**
		 * delete by uuid
		 * 
		 * @param  tableName
		 * @param  uuid
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function deleteByUUID(tableName:String, uuid:String, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.deleteByUUID.addEventListener(ResultEvent.RESULT, resultHandler);	//for delete bind listener
			if (faultHandler != null)
				ro.deleteByUUID.addEventListener(FaultEvent.FAULT, faultHandler);	//for delete bind listener
			ro.deleteByUUID(tableName, uuid);//execute delete
		}

		/**
		 * delete by all uuid
		 * 
		 * @param  tableName
		 * @param  uuidArr
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function deleteByAllUUID(tableName:String, uuidArr:ArrayCollection, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.deleteByAllUUID.addEventListener(ResultEvent.RESULT, resultHandler);	//for delete bind listener
			if (faultHandler != null)
				ro.deleteByAllUUID.addEventListener(FaultEvent.FAULT, faultHandler);	//for delete bind listener

			ro.deleteByAllUUID(tableName, uuidArr);	//execute delete
		}

		/**
		 * delete by hql
		 * 
		 * @param  hql
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function deleteByHql(hql:String, resultHandler:Function=null, faultHandler:Function=null):void{
			if (resultHandler != null)
				ro.deleteByHql.addEventListener(ResultEvent.RESULT, resultHandler);	//for delete bind listener
			if (faultHandler != null)
				ro.deleteByHql.addEventListener(FaultEvent.FAULT, faultHandler);	//for delete bind listener
			ro.deleteByHql(hql);	//execute delete
		}

		/**
		 * find by hql
		 * 
		 * @param  hql
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function findByHql(hql:String, resultHandler:Function, faultHandler:Function=null):void{
			ro.findByHql.addEventListener(ResultEvent.RESULT, resultHandler);
			if (faultHandler != null)
				ro.findByHql.addEventListener(FaultEvent.FAULT, faultHandler);	//for find bind listener
			ro.findByHql(hql);	//execute find
		}
		
		/**
		 * find by name query
		 * 
		 * @param  queryName
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function findByNamedQuery(queryName:String, resultHandler:Function, faultHandler:Function=null):void{
			ro.findByNamedQuery.addEventListener(ResultEvent.RESULT, resultHandler);
			if (faultHandler != null)
				ro.findByNamedQuery.addEventListener(FaultEvent.FAULT, faultHandler);	//for find bind listener
			ro.findByNamedQuery(queryName);	//execute find
		}
		
		/**
		 * config page
		 * 
		 * @param  pageNo
		 * @param  pageSize
		 * @param  hql
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function pagination(pageNo:int,pageSize:int,hql:String, resultHandler:Function, faultHandler:Function=null):void{
			ro.pagination.addEventListener(ResultEvent.RESULT, resultHandler);
			if (faultHandler != null)
				ro.pagination.addEventListener(FaultEvent.FAULT, faultHandler);
			ro.pagination(pageNo,pageSize,hql);
		}

		/**
		 * unique validate  successHandler 
		 * 
		 * @param  tableName
		 * @param  field
		 * @param  value
		 * @param  successHandler
		 * @param  errorHandler
		 * @return 
		 */
		public static function unique(tableName:String,field:String,value:String,successHandler:Function=null,errorHandler:Function=null):void {
			var service:AutoService=new AutoService();
			//piece together hql
			var hql:String="from "+tableName +" v where v."+field+"='"+value+"'";
			service.findByHql(hql,function(e:ResultEvent):void {
				var ac:ArrayCollection=e.result as ArrayCollection;
				if(ac.length<=0) {
					if(successHandler!=null) {
						successHandler.call();		//call function
					}
				}else {
					if(errorHandler!=null) {
						errorHandler.call();		//call function
					}
				}
			});
		}
		/**
		 * asynchronous call method
		 * 
		 * @param  serviceName
		 * @param  methodName
		 * @param  hm
		 * @param  resultHandler
		 * @param  faultHandler
		 * @return 
		 */
		public function callfunc(serviceName:String, methodName:String, hm:Object, resultHandler:Function, faultHandler:Function=null):void {
			if (resultHandler != null)
				ro.callfunc.addEventListener(ResultEvent.RESULT, resultHandler);		//To call function add listener
			if (faultHandler != null)
				ro.callfunc.addEventListener(FaultEvent.FAULT, faultHandler);	//To call function add listener
			ro.callfunc(serviceName,methodName,hm); //execute
		}
		/**
		 * after success
		 * 
		 * @param  event
		 * @return 
		 */
		private function resultHandler(event:ResultEvent):void{
			trace("AutoService->resultHandler->" + event.result);
		}
		/**
		 * after fail
		 * 
		 * @param  event
		 * @return 
		 */
		private function faultHandler(event:FaultEvent):void{
			trace("AutoService->faultHandler->"+event.fault);
			if(event.fault.faultCode=="Client.Error.MessageSend") {
				var urlRequest:URLRequest = new URLRequest(getUrlRoot());
				navigateToURL(urlRequest);
				return;
			}else {
				trace("AutoService:\nfaultHandler:" + event.fault + "\nmessage:" + ""+"\n:"+event.fault.faultCode);	
				Alert.show("不可接受的操作");			
			}
			
		}
		/**
		 * obtain url root
		 * 
		 * @param  
		 * @return String
		 */
		private function getUrlRoot():String{
			var url:String = Application.application.url;
			var fullURL:String = URLUtil.getFullURL(url, url);
			return fullURL.substr(0, fullURL.indexOf("/vw/"));
		}
	}
}

