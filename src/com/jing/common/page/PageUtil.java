package com.jing.common.page;

/**
 * @author liuzd
 * @version 1.0 2011-05-12
 * @since JDK1.5
 * */
public class PageUtil {
	
	public static final String ASC = "asc";
	public static final String DESC = "desc";
	public static final String PAGE_DESC = "锟斤拷";
	public static final String PAGE_ASC = "锟斤拷";
	public static final String PAGE_NULL = "&nbsp;&nbsp;";	
	public static final String SESSION_PAGE_KEY = "page";	
	
	
	public  static Page inintPage(Long totalCount,Integer index,String value,Page sessionPage){	
		Page page = null;
		if(index < 0){
			 page = new Page(totalCount);
		}else{
			 Long everPage = null == value ? 10 : Long.parseLong(value);
			 page = sessionPage;			 
			 page.setEveryPage(everPage);
			 page.setTotalCount(totalCount);			
		}	
		return page;		
	}
	

	public static Page execPage(int  index,String value,Page sessionPage){	
		Page page = sessionPage;			
		page.pageState(index,value);		
		return page;		
	}

}
