public class TabularSolutionSpaceOptimized{
    
    public static final List<List<Integer>> MCPARRAY = new List<List<Integer>>{
        new List<Integer>{3, 2,  12, 15, 10},
        new List<Integer>{6, 19, 7,  11, 17},
        new List<Integer>{8, 5,  12, 32, 21},
        new List<Integer>{3, 20, 2,  9,  7 }};
        
    public List<List<Integer>> sumArraySpaceOptimized = new List<List<Integer>>{
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0}
    }; 

    
    public Integer calculateMCPTabularSpaceOptimized(Integer i, Integer j){
        sumArraySpaceOptimized[0][0] = MCPARRAY[0][0];
        Integer pointer = 0;
        for(Integer a = 0; a <= i; a++){
            for(Integer b = 0; b <= j; b++){
                if(pointer - 1 >= 0 && b-1 >=0){
                    sumArraySpaceOptimized[pointer][b] = MCPARRAY[a][b] + Math.min(sumArraySpaceOptimized[pointer-1][b], sumArraySpaceOptimized[pointer][b-1]);
                } else if(pointer - 1 >= 0){
                    sumArraySpaceOptimized[pointer][b] = MCPARRAY[a][b] + sumArraySpaceOptimized[pointer-1][b];
                } else if(b - 1 >= 0){
                    sumArraySpaceOptimized[pointer][b] = MCPARRAY[a][b] + sumArraySpaceOptimized[pointer][b-1];
                }
                
            }
            System.debug(sumArraySpaceOptimized[0]);
            System.debug(sumArraySpaceOptimized[1]);
            System.debug('-----------------------');
            if(a + 1 >= 2){
                sumArraySpaceOptimized[0] = sumArraySpaceOptimized[1];
                sumArraySpaceOptimized[1] = new List<Integer>{0,0,0,0,0};
            }
            pointer = 1;
        }
        return sumArraySpaceOptimized[0][j];
    }

}