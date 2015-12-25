package com
{
	import component.uploading;
	
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	/**
	 * File upload function class
	 */
	public class FilesUpload extends UIComponent
	{
		//upload finish handle function
		private var _completeHandle:Function;
		//error handle function
		private var _errorHandle:Function;
		//request url
		private var _urlRequest:URLRequest;
		//files array
		private var _files:ArrayCollection;
		//file names array
		private var _fileNames:ArrayCollection;
		//uploading screen
		private var _uw:uploading;
		
		private var _fileSum:int;	//total files
		/**
		 * Constructor
		 * 
		 * @param files
		 * @param fileNames
		 * @param urlRequest
		 * @param completeHandle
		 * @param errorHandle
		 * @param uploadWindow
		 * @return 
		 */
		public function FilesUpload(files:ArrayCollection, fileNames:ArrayCollection, urlRequest:URLRequest, completeHandle:Function, errorHandle:Function, uploadWindow:uploading){
			_files = files;
			_fileNames = fileNames;
			_completeHandle = completeHandle;
			_errorHandle = errorHandle;
			_urlRequest = urlRequest;
			_uw = uploadWindow;
			_fileSum = files.length;
		}
		/**
		 * upload file
		 * 
		 * @param 
		 * @return
		 */
		public function upload():void{
			if(_files !== null && _files.length > 0){
				var _file:FileReference = FileReference(_files.getItemAt(0));
				_file.addEventListener(ProgressEvent.PROGRESS, onUploadProgress);	//bind progress call back function
                _file.addEventListener(Event.COMPLETE, completeHandler);		//bind complete call back function
                _file.addEventListener(SecurityErrorEvent.SECURITY_ERROR,securityErrorHandler); //bind security error call back function
                _file.addEventListener(HTTPStatusEvent.HTTP_STATUS,httpStatusHandler);
                _file.addEventListener(IOErrorEvent.IO_ERROR,ioErrorHandler);	//bind io error call back function
                trace("_fileNames.getItemAt(0):" + _fileNames.getItemAt(0));
                _urlRequest.data = "&fileName="+encodeURI(encodeURI(_fileNames.getItemAt(0).toString()));
                _urlRequest.method = URLRequestMethod.GET;   //set request method 'get'(two type:'get' and 'post')
                
                _file.upload(_urlRequest);
			}else{
				_completeHandle.call();
			}
		}
		
		/**
		 * Get upload progress
		 * 
		 * @param  event
		 * @return
		 */
		private function onUploadProgress(event:ProgressEvent):void{
			//set processing windwo text
            _uw.fileName.text = _fileNames.getItemAt(0).toString();
			_uw.fileNum.text = (_fileSum - (_files.length -1) )+"/"+_fileSum;
			
			var numPerc:Number=Math.round((event.bytesLoaded / event.bytesTotal) * 100);
			_uw.proBar.setProgress(numPerc, 100);
			_uw.proBar.validateNow();
			trace("----------"+numPerc);
		}
		/**
		 * handle http status
		 * 
		 * @param  event
		 * @return
		 */
		private function httpStatusHandler(event:HTTPStatusEvent):void {
            if (event.status !== 200){
                mx.controls.Alert.show("Error",String(event),0);
                _errorHandle.call();
            }
   		}
   		/**
		 * trigger this function when io error happen
		 * 
		 * @param  event
		 * @return
		 */
   		private function ioErrorHandler(event:IOErrorEvent):void{
            mx.controls.Alert.show(String(event),"ioError",0);
            _errorHandle.call();
        } 
        /**
		 * trigger this function when sercurity error happen
		 * 
		 * @param  event
		 * @return
		 */
        private function securityErrorHandler(event:SecurityErrorEvent):void{
            mx.controls.Alert.show("Security Error",String(event),0);
            _errorHandle.call();
        }
        /**
		 * trigger this function when complete operation
		 * 
		 * @param  event
		 * @return
		 */
        private function completeHandler(event:Event):void{
            trace(_files.length);
			_files.removeItemAt(0);
			_fileNames.removeItemAt(0);
			upload();
        }
	}
}