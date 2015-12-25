package com
{
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.controls.LinkButton;
	/**
	 * Paging function
	 * 
	 */
	public class Page
	{
		/**
		 * set default value
		 * pageRecordes:a page display 10 line
		 * totalPages:total pages is 1
		 * totalRows:obtain total rows  from database
		 * currentPage:default current page is 1
		 * pageStartRow:current page first row
		 * pageEndRow:current page last row
		 * fPage:first page
		 * pPage:previous page
		 * nPage:next page
		 * lPage:last page
		 * */
		[Bindable]
		public var pageRecordes:uint=10;
		[Bindable]
		public var totalPages:uint=1;
		[Bindable]
		public var totalRows:uint=0;
		[Bindable]
		public var currentPage:uint=1;
		[Bindable]
		public var pageStartRow:uint=1;
		[Bindable]
		public var pageEndRow:uint=0;
		public var datagrid:AdvancedDataGrid;
		public var arr:Array;
		public var fPage:LinkButton;
		public var pPage:LinkButton;
		public var nPage:LinkButton;
		public var lPage:LinkButton;
		/**
		 * Paging Constructor
		 * 
		 * @param datagrid
		 * @param arr
		 * @param fPage:first page
		 * @param pPage:prev page
		 * @param nPage:next page
		 * @param lPage:last page
		 * @param pageRecordes
		 * @return 
		 */
		public function Page(datagrid:AdvancedDataGrid, arr:Array, fPage:LinkButton, pPage:LinkButton, nPage:LinkButton, lPage:LinkButton,pageRecordes:uint){
			this.pageRecordes = pageRecordes;
			this.datagrid=datagrid;
			this.arr=arr;
			this.fPage=fPage;
			this.pPage=pPage;
			this.nPage=nPage;
			this.lPage=lPage;
			this.fPage.enabled=false;
			this.pPage.enabled=false;
			this.nPage.enabled=false;
			this.lPage.enabled=false;
		}
		/**
		 * 
		 * 
		 * delete items selected
		 * 
		 * @param object
		 * @return 
		 */
		public function remove(object:Object):void{
			var ins:int=arr.indexOf(object);
			arr.splice(ins, 1);
		}
		/**
		 * 
		 * 
		 * refresh table after remove items
		 * 
		 * @param 
		 * @return 
		 */
		public function reload():void{
			if (arr === null || arr.length === 0){
				datagrid.dataProvider=arr;
				pPage.enabled=false;
				nPage.enabled=false;
				fPage.enabled=false;
				lPage.enabled=false;
			}else{
				totalRows=arr.length;
				if (totalRows <= pageRecordes){
					this.pageStartRow=1;
					this.pageEndRow=totalRows;
					datagrid.dataProvider=arr;
				}
				if ((totalRows % pageRecordes) === 0){
					totalPages=Math.floor(totalRows / pageRecordes);
				}else{
					totalPages=Math.floor(totalRows / pageRecordes + 1);
				}

				if (totalRows > pageRecordes){
					if (this.pageStartRow > this.totalRows){
						this.currentPage=currentPage - 1;
						this.pageStartRow=this.pageStartRow - pageRecordes;
						this.pageEndRow=totalRows;
					}else if (this.pageStartRow === this.totalRows){
						this.currentPage=this.currentPage;
						this.pageStartRow=this.pageStartRow;
						this.pageEndRow=totalRows;
					}else{
						this.currentPage=this.currentPage;
						this.pageStartRow=this.pageStartRow;
						if (pageEndRow >= totalRows){
							pageEndRow=totalRows;
						}else{
							pageEndRow=pageEndRow;
						}
					}
				}
				datagrid.dataProvider=arr.slice(pageStartRow - 1, pageEndRow);
				//set pre,next,fisrt,last button if could click
				visible();
			}
		}
		/**
		 * Initial application
		 * 
		 * @param 
		 * @return 
		 */
		public function initApp():void{
			if (arr === null || arr.length === 0){
				datagrid.dataProvider=arr;
			}else{
				totalRows=arr.length;
				if (totalRows <= pageRecordes){
					this.pageStartRow=1;
					this.pageEndRow=totalRows;
					datagrid.dataProvider=arr;
				}else{
					this.pageStartRow=1;
					this.pageEndRow=pageRecordes;
					if (arr.length > pageRecordes){
						datagrid.dataProvider=arr.slice(0, pageRecordes);
					}
				}

				if ((totalRows % pageRecordes) === 0){
					totalPages=Math.floor(totalRows / pageRecordes);
				}else{
					totalPages=Math.floor(totalRows / pageRecordes + 1);
				}
				//set pre,next,fisrt,last button if could click
				visible();
			}
		}
		/**
		 * call this function when click previous button
		 * 
		 * @param 
		 * @return 
		 */
		public function showPreviousPage():void{
			currentPage=currentPage - 1;
			if (currentPage === totalPages){
				pageStartRow=(currentPage - 1) * pageRecordes + 1;
				pageEndRow=totalRows;
			}else{
				pageStartRow=(currentPage - 1) * pageRecordes + 1;
				pageEndRow=pageStartRow + pageRecordes - 1;
			}
			datagrid.dataProvider=arr.slice(pageStartRow - 1, pageEndRow);
			//set pre,next,fisrt,last button if could click
			visible();
		}
		/**
		 * call this function when click next button
		 * 
		 * @param 
		 * @return 
		 */
		public function showNextPage():void{
			currentPage=currentPage + 1;
			if (currentPage === totalPages){
				pageStartRow=(currentPage - 1) * pageRecordes + 1;
				pageEndRow=totalRows;
			}else{
				pageStartRow=(currentPage - 1) * pageRecordes + 1;
				pageEndRow=pageStartRow + pageRecordes - 1;
			}
			datagrid.dataProvider=arr.slice(pageStartRow - 1, pageEndRow);
			//set pre,next,fisrt,last button if could click
			visible();
		}
		/**
		 * call this function when click first button
		 * 
		 * @param 
		 * @return 
		 */
		public function showFirstPage():void{
			currentPage=1;
			pageStartRow=1;
			pageEndRow=pageRecordes;
			pPage.enabled=false;
			nPage.enabled=true;
			datagrid.dataProvider=arr.slice(0, pageRecordes);
			//set pre,next,fisrt,last button if could click
			visible();
		}
		/**
		 * call this function when click last button
		 * 
		 * @param 
		 * @return 
		 */
		public function showLastPage():void{
			currentPage=totalPages;
			pageEndRow=totalRows;
			pageStartRow=(currentPage - 1) * pageRecordes + 1;
			datagrid.dataProvider=arr.slice(pageStartRow - 1, totalRows);
			//set pre,next,fisrt,last button if could click
			visible();
		}
		/**
		 * set button enable or disable
		 * 
		 * @param 
		 * @return 
		 */
		public function visible():void{
			if (totalPages === 1){
				fPage.enabled=false;
				pPage.enabled=false;
				nPage.enabled=false;
				lPage.enabled=false;
			}
			if (currentPage === 1){
				fPage.enabled=false;
				pPage.enabled=false;
			}else{
				pPage.enabled=true;
				fPage.enabled=true;
			}
			if (currentPage === totalPages){
				nPage.enabled=false;
				lPage.enabled=false;
			}else{
				nPage.enabled=true;
				lPage.enabled=true;
			}
		}
	}
}