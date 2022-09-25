public class TabularSolution {
    
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
            
    public Integer calculateMCPTabular(Integer i, Integer j){
        sumArray[0][0] = MCPARRAY[0][0];
        for(Integer a = 0; a <= i; a++){
            for(Integer b = 0; b <= j; b++){
                if(a - 1 >= 0 && b-1 >=0){
                    sumArray[a][b] = MCPARRAY[a][b] + Math.min(sumArray[a-1][b], sumArray[a][b-1]);
                } else if(a - 1 >= 0){
                    sumArray[a][b] = MCPARRAY[a][b] + sumArray[a-1][b];
                } else if(b - 1 >= 0){
                    sumArray[a][b] = MCPARRAY[a][b] + sumArray[a][b-1];
                }
                
            }
        }
        return sumArray[i][j];
    }

}