public class VelocityProgrammingContest {
    public static Map<Integer, Integer> integerCombo(List<integer> integerList, integer sumVal){
        Map<Integer, Integer> newMap = new Map<Integer, Integer>();
        for(integer i = 0; i< integerList.size(); i++){
            integer temp = sumVal - integerList[i];
            for(integer j = i+1; j< integerList.size(); j++){
                if(temp == integerList[j]){
                    newMap.put(integerList[i], integerList[j]);
                    break;
                }      
            }
        }
        system.debug('New Map values are : '+newMap);
        return newMap;
    }
    
    
    public static boolean anagramProgrem(String firstString, string secondString){
        string[] tempArray = new List<string>();
        system.debug('firstString.length(): '+firstString.length());//3
        for(integer i = 0; i < firstString.length(); i++){
            if(i== firstString.length()-1){
                tempArray.add(firstString.substring(i));
                system.debug('val: '+firstString.substring(i));
            }else{
                tempArray.add(firstString.substring(i, i+1));
            }
        }
        for(integer j = 0; j < secondString.length(); j++){
            if(j== firstString.length()-1){
                system.debug('Last Index '+secondString.substring(j));
                system.debug('Last Index Value Conditions: '+tempArray.contains(secondString.substring(j)));
                if(tempArray.contains(secondString.substring(j))){
                    tempArray[j]= 'Removed';
                }
            }
            //system.debugtempArray[j]
                else{
                    system.debug('Esle: Value : '+secondString.substring(j, j+1));
                system.debug('Else: Conditions :  '+tempArray.contains(secondString.substring(j, j+1)));
                    if(tempArray.contains(secondString.substring(j, j+1))){
                        tempArray[j]= 'Removed';
                    }
                }
        }
        return false;        
    }
}