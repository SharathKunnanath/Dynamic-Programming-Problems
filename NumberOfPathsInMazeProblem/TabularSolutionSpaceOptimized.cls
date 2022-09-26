public class TabularSolutionSpaceOptimized{
    
    public static final List<List<Integer>> MATRIX_MAZE = new List<List<Integer>>{
        new List<Integer>{0, 0, 1, 0, 1},
        new List<Integer>{0, 0, 0, 0, 1},
        new List<Integer>{0, 0, 1, 0, 0},
        new List<Integer>{1, 0, 0, 0, 0}
    };

    public List<List<Integer>> pathCountsSpaceOptimized = new List<List<Integer>>{
        new List<Integer>{-1, -1, -1, -1, -1},
        new List<Integer>{-1, -1, -1, -1, -1} 
    };
   
    public Integer calculateTotalPathsTabularSpaceOptimized(Integer i, Integer j){
        
        pathCountsSpaceOptimized[0][0] = 1;
        Integer pointer = 0;
        for(Integer a = 0; a <= i; a++){
            for(Integer b = 0; b <= j; b++){
                if(MATRIX_MAZE[a][b] == 1){
                    pathCountsSpaceOptimized[pointer][b] = 0;
                } else if(pointer - 1 >= 0 && b - 1 >= 0){
                    pathCountsSpaceOptimized[pointer][b] = pathCountsSpaceOptimized[pointer-1][b] + pathCountsSpaceOptimized[pointer][b-1];
                }else if(pointer - 1 >= 0){
                    pathCountsSpaceOptimized[pointer][b] = pathCountsSpaceOptimized[pointer-1][b];
                }else if(b - 1 >= 0){
                    pathCountsSpaceOptimized[pointer][b] = pathCountsSpaceOptimized[pointer][b-1];
                }
            }
            if(a + 1 >= 2){
                pathCountsSpaceOptimized[0] = pathCountsSpaceOptimized[1];
                pathCountsSpaceOptimized[1] = new List<Integer> {-1, -1, -1, -1, -1};
            }
            pointer = 1;
        }
        return pathCountsSpaceOptimized[0][j];
    }

}