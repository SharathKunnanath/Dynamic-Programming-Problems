public class MemoizedSolution {
    
    public static final List<List<Integer>> MCPARRAY = new List<List<Integer>>{
        new List<Integer>{3, 2,  12, 15, 10},
        new List<Integer>{6, 19, 7,  11, 17},
        new List<Integer>{8, 5,  12, 32, 21},
        new List<Integer>{3, 20, 2,  9,  7 }};
    
    public List<List<Integer>> sumArray = new List<List<Integer>>{
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0}
    };
            
    private static final Integer INTEGER_MAX = 2147483647; 
            
    public Integer calculateMCPMemoization(Integer i, Integer j){
        if(i < 0 || j < 0) return INTEGER_MAX;          
        if (i == 0 && j == 0) return MCPARRAY[i][j];
        if(sumArray[i][j] != 0) return sumArray[i][j];
        sumArray[i][j] = MCPARRAY[i][j] + Math.min(calculateMCPMemoization(i-1, j), calculateMCPMemoization(i, j-1));
        return sumArray[i][j];
    }

}