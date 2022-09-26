public class TabularSolution {
    
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
    
    public Integer calculateTotalPathsTabular(Integer i, Integer j){
        
        pathCounts[0][0] = 1;
        for(Integer a = 0; a <= i; a++){
            for(Integer b = 0; b <= j; b++){
                if(MATRIX_MAZE[a][b] == 1){ 
                    pathCounts[a][b] = 0;
                }else if(a-1 >= 0 && b-1 >= 0){
                	pathCounts[a][b] = pathCounts[a-1][b] + pathCounts[a][b-1];
                }else if(a-1 >= 0) {
                    pathCounts[a][b] = pathCounts[a-1][b];
                }else if(b-1 >= 0) {
                    pathCounts[a][b] = pathCounts[a][b-1];
                }
            }
        }
        return pathCounts[i][j];
   }

}