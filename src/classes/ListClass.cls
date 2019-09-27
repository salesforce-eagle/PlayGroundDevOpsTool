public class ListClass {
    public static Boolean listCompareResult;
    public static boolean customCampare(List<object> lst1, List<object> lst2, boolean caseSensitiveCheck){
        listCompareResult = true;
        if(lst1.size() == lst2.Size()){
            if(!caseSensitiveCheck){
                boolean tempResult;
                for(integer i= 0; i < lst1.size(); i++){
                    if(lst1[i] == lst2[i]){
                        tempResult = true;
                        listCompareResult = tempResult && listCompareResult;
                    }else{
                        tempResult =  false;
                        listCompareResult = tempResult && listCompareResult;
                        if(!listCompareResult)
                            break;
                    }
                }                
            }else{
                boolean tempResult;
                for(integer i= 0; i < lst1.size(); i++){
                    if(lst1[i].hashCode() == lst2[i].hashCode()){
                        tempResult = true;
                        listCompareResult = tempResult && listCompareResult;
                    }else{
                        tempResult =  false;
                        listCompareResult = tempResult && listCompareResult;
                        if(!listCompareResult)
                            break;
                    }
                }   
            }
        }else{
            listCompareResult = false;
        }
        system.debug('listCompareResult: '+listCompareResult);
        return listCompareResult;
    }
    
    Public static integer customSearch(List<object> arr, string chr){
       integer x = chr.hashCode();
        if(!arr.isEmpty()){
            system.debug('Before: '+arr);
            integer l = 0, r = arr.size() - 1;//l = 0; r = 9
            integer counter = 1;
            while (l <= r) {//0<=9
                system.debug('Check Count Loop: '+ counter++);
                integer m = l + (r - l) / 2;//m = 0+9/2 = 4
                // Check if x is present at mid
                if (arr[m].hashCode() == x){
                    system.debug('Found Here: '+m);
                    return m;
                }
                // If x greater, ignore left half 
                if (arr[m].hashCode() < x){
                    system.debug('Found: '+l);
                    l = m + 1;
                }                                     
                // If x is smaller, ignore right half 
                else{
                    system.debug('Found at: '+r);
                    r = m - 1;
                }                     
            }
            return -1; 
        }
        return -1;
    }
}