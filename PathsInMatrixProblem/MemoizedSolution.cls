public class MemoizedSolution {
    
    public static final List<List<Integer>> MATRIX_MAZE = new List<List<Integer>>{
        new List<Integer>{0, 0, 1, 0, 1},
        new List<Integer>{0, 0, 0, 0, 1},
        new List<Integer>{0, 0, 1, 0, 0},
        new List<Integer>{1, 0, 0, 0, 0}
    };
        
    public List<List<Integer>> pathCounts = new List<List<Integer>>{
        new List<Integer>{-1, -1, -1, -1, -1},
        new List<Integer>{-1, -1, -1, -1, -1},
        new List<Integer>{-1, -1, -1, -1, -1},
        new List<Integer>{-1, -1, -1, -1, -1}    
    };
        
    public Integer calculateTotalPathsMemoized(Integer i, Integer j){
        
        if(i == 0 && j ==0) return 1;
        if(pathCounts[i][j] != -1) return pathCounts[i][j];
        if(MATRIX_MAZE[i][j] == 1) return 0;
        
        if(i - 1 >= 0 && j - 1 >= 0){
        	pathCounts[i][j] = calculateTotalPathsMemoized(i-1,j) + calculateTotalPathsMemoized(i, j - 1);
        }else if(i - 1 >= 0){
            pathCounts[i][j] = calculateTotalPathsMemoized(i-1, j);
        }else if(j - 1 >= 0){
            pathCounts[i][j] = calculateTotalPathsMemoized(i, j-1);
        } else {
            return 0;
        }
        return pathCounts[i][j];
        
    }

}