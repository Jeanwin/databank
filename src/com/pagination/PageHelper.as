package com.pagination
{
	import mx.controls.Alert;
	import mx.controls.LinkButton;

	/**
	 * Paging class uses function：page=new PageHelper(15, fPage, pPage, nPage, lPage);
	 * Set call back function	 page.callFunc=null;
	 * Set total recorder in calling back function  page.setTotalRows(0);
	 * page.setDataProvider();				 
	 */
	public class PageHelper
	{
		[Bindable]
		public var totalRows:Number=0; //Total rows
		[Bindable]
		public var pageSize:Number=10; //a page display lines
		[Bindable]
		public var currentPage:Number=-1; //current page number
		[Bindable]
		public var totalPages:Number=-1; //total pages
		[Bindable]
		public var startRow:Number=-1; //current page first row number in database
		[Bindable]
		public var fPage:LinkButton; //first page button
		[Bindable]
		public var pPage:LinkButton; //previous page button
		[Bindable]
		public var nPage:LinkButton; //next page button
		[Bindable]
		public var lPage:LinkButton; //last page button
		[Bindable]
		public var callFunc:Function; //call function var

		/**
		 *Constructor
		 * 
		 * @param _pageSize
		 * @param _fPage
		 * @param _pPage
		 * @param _nPage
		 * @param _lPage
		 * @return
		 */
		public function PageHelper(_pageSize:Number, _fPage:LinkButton, _pPage:LinkButton, _nPage:LinkButton, _lPage:LinkButton):void{
			this.fPage=_fPage;
			this.pPage=_pPage;
			this.nPage=_nPage;
			this.lPage=_lPage;
			this.pageSize=_pageSize;
		}

		/**
		 *set button status
		 * 
		 * @param 
		 * @return
		 */
		public function setEnables():void{
			//if totalPages is 0, all button can not click
			if (totalPages == 0){
				fPage.enabled=false;
				pPage.enabled=false;
				nPage.enabled=false;
				lPage.enabled=false;
			}
			//if currentPage and totalPages both are 1, all button can't click
			if (currentPage == 1 && totalPages == 1){
				fPage.enabled=false;
				pPage.enabled=false;
				nPage.enabled=false;
				lPage.enabled=false;
			}
			//if currentPage is 1 and totalPages is more than 1, 
			//only next page and last page button can be clicked
			if (currentPage == 1 && totalPages > 1){
				fPage.enabled=false;
				pPage.enabled=false;
				nPage.enabled=true;
				lPage.enabled=true;
			}
			//if currentPage is more than 1 and totalPages equal currentPage,
			//only first page and previous page button can be clicked
			if (currentPage > 1 && totalPages == currentPage){
				fPage.enabled=true;
				pPage.enabled=true;
				nPage.enabled=false;
				lPage.enabled=false;
			}
			//if currentPage is more than 1 and totalPages greater than currentPage,
			//all button can be clicked
			if (currentPage > 1 && totalPages > currentPage){
				fPage.enabled=true;
				pPage.enabled=true;
				nPage.enabled=true;
				lPage.enabled=true;
			}

		}
		/**
		 * call bindable function 
		 * 
		 * @param 
		 * @return
		 */
		public function setDataProvider():void{
			callFunc.call(this);
		}

		/**
		 *set total rows
		 * 
		 * @param _totalRows
		 * @return
		 */
		public function setTotalRows(_totalRows:Number):void{
			this.totalRows=_totalRows;
			if (totalRows == 0){
				totalPages=1;
				currentPage=1;
				startRow=0;
				fPage.enabled=false;
				pPage.enabled=false;
				nPage.enabled=false;
				lPage.enabled=false;
				return;
			}
			if (totalRows == pageSize){
				totalPages=1;
				currentPage=1;
				startRow=0;
				fPage.enabled=false;
				pPage.enabled=false;
				nPage.enabled=false;
				lPage.enabled=false;
				return;
			}
			if ((totalRows % pageSize) == 0){
				totalPages=Math.floor(totalRows / pageSize);
			}
			else{
				totalPages=Math.floor(totalRows / pageSize + 1);
			}
			if (this.currentPage >= this.totalPages){
				this.currentPage=this.totalPages;
				this.startRow=(this.currentPage - 1) * this.pageSize;
				setEnables();
			}else if (this.currentPage < this.totalPages){
				if (currentPage <= 1){
					first();
				}else{
					refresh();
				}
			}
		}

		/**
		 *obtain total pages
		 * 
		 * @param 
		 * @return Number
		 */
		public function getTotalPages():Number{
			return this.totalPages;
		}

		/**
		 *obtain current page
		 * 
		 * @param 
		 * @return Number
		 */
		public function getCurrentPage():Number{
			return this.currentPage;
		}

		/**
		 *obtain a page total rows
		 * 
		 * @param 
		 * @return Number
		 */
		public function getPageSize():Number{
			return this.pageSize;
		}

		/**
		 *set a page total rows
		 * 
		 * @param _pageSize
		 * @return 
		 */
		public function setPageSize(_pageSize:Number):void{
			this.pageSize=_pageSize;
		}

		/**
		 *obtain total rows
		 * 
		 * @param 
		 * @return Number
		 */
		public function getTotalRows():Number{
			return this.totalRows;
		}

		/**
		 *first page
		 * 
		 * @param 
		 * @return 
		 */
		public function first():void{
			this.currentPage=1;
			this.startRow=0;
			setEnables();
		}

		/**
		 *previous page
		 * 
		 * @param 
		 * @return  
		 */
		public function previous():void{
			if (this.currentPage == 1){
				first();
			}else if (this.currentPage > 1){
				this.currentPage--;
				this.startRow=(this.currentPage - 1) * this.pageSize;
			}else{
				first();
			}
			setEnables();
		}

		/**
		 *next page
		 * 
		 * @param 
		 * @return 
		 */
		public function next():void{
			if (this.currentPage < this.totalPages){
				this.currentPage++;
				this.startRow=(this.currentPage - 1) * this.pageSize;
			}else{
				last();
			}
			setEnables();

		}

		/**
		 * last page
		 * 
		 * @param 
		 * @return 
		 */
		public function last():void{
			this.currentPage=this.totalPages;
			this.startRow=(this.currentPage - 1) * this.pageSize;
			setEnables();
		}

		/**
		 * refresh current page
		 * 
		 * @param 
		 * @return 
		 */
		public function refresh():void{}

	}
}