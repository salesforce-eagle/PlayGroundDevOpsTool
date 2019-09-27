public class CustomComparator implements comparable{
    public string str;
    public CustomComparator(string str){
        this.str = str;
    }
    public Integer compareTo(Object objToCompare){
        CustomComparator cc = (CustomComparator)objToCompare;
        if(str == cc.str)
            return 0;
        if(str > cc.str)
            return 1;
        else
            return -1;
    }
    
}