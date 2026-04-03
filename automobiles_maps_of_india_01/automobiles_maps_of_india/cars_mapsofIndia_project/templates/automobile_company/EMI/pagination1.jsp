<%!

public String pagination(int total, int result_per_page, int current_page, int no_of_element, String url){
    String pagination = "";
    int previous_page = 0;
    int next_page = 0;
    
    //Calculating no of pages.
    int pages = total/result_per_page;
    
    if(total%result_per_page != 0)
        pages++;
    
    int start = 0, last = 0;
    
    if(pages != 1){
        // initializing variables;
        previous_page = current_page - 1;
        next_page = current_page + 1;
        if(previous_page < 1){ previous_page = 1; }
        if(next_page > pages){ next_page = pages; }
        
        // we begin the unordered list of items
        // we start by adding the link for the very first page and the previous page
        if(current_page != 1){
            pagination = pagination + "<a style='text-decoration:underline:color:maroon' href='"+url+"pno=1'>First</a>"+
                    "<a style='text-decoration:underline:color:maroon' href='"+url+"pno="+previous_page+"'>Previous</a>";
        }
        
        // then we generate a link for every single page
        if( (current_page - no_of_element) <= 0 ) {
            start = 1;
        } else {
            start = current_page - no_of_element;
        }
        
        if( (current_page + no_of_element) >= pages ){
            last = pages;
        } else {
            last = current_page + no_of_element;
        }
        
        for( int i = start; i <= last; i++){
            if( current_page == i ){
                pagination = pagination + "&nbsp;&nbsp;&nbsp;<b>"+i+"</b>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;";
            } else {
                pagination = pagination + "<a href='"+url+"pno="+i+"'> "+i+" </a>&nbsp;|&nbsp;";
            }
        }
        
        // we now add the link for the next page and the last page
        if( current_page != pages ){
            pagination = pagination + "<a href='"+url+"pno="+next_page+"'>Next</a>"+
                    "<a href='"+url+"pno="+pages+"'>Last</a>";
        }
    }
    return pagination;
}

%>