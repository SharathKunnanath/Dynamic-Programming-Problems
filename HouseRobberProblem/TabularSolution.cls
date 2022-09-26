public class HouseRobberProblem {
    
    public static final List<Integer> HOUSES = new List<Integer>{2, 10, 3, 6, 8, 1, 7, 1, 11, 12};
    
    public Integer getMoneyTabular(){
        
        List<Integer> arr = new List<Integer>(HOUSES);
        
        for(Integer i = 0; i < HOUSES.size(); i++){
            if(i < 1){ 
                continue;
            } else if (i == 1){
                arr[i] = Math.max(arr[i], arr[i-1]);
            } else {    
            	arr[i] = Math.max(arr[i] + arr[i-2], arr[i-1]);
            }
        }
        
        return arr[arr.size() - 1];
    }

}