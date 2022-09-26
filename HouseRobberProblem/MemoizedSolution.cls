public class MemoizedSolution {
    
    public static final List<Integer> HOUSES = new List<Integer>{2, 10, 3, 6, 8, 1, 7, 1, 11, 12};
    
    public List<Integer> maxLoot = new List<Integer> {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};      
    
    public Integer getMoney(Integer n) {
        
        if(maxLoot[n] != -1) return maxLoot[n];
        
        if(n == 0){ 
            maxLoot[n] = HOUSES[n];
        }else if(n == 1){
            maxLoot[n] = Math.max(HOUSES[n], HOUSES[n-1]);
        } else {
    		maxLoot[n] = Math.max(HOUSES[n] + getMoney(n-2), getMoney(n-1));
        }
        
        return maxLoot[n];
    }

}