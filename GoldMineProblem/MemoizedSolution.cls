public class GoldMine {
    
    public static final List<List<Integer>> GOLD_MINE = new List<List<Integer>>{
        new List<Integer>{3, 2,  12, 15, 10},
        new List<Integer>{6, 19, 7,  11, 17},
        new List<Integer>{8, 5,  12, 32, 21},
        new List<Integer>{3, 20, 2,  9,  7 }
    };
        
    private List<List<Integer>> maxGold = new List<List<Integer>>{
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0},
        new List<Integer>{0,0,0,0,0}
    };
     
   	private Integer maxGoldSum = 0;
    private Integer exitLocation = 0;
    private Boolean maxGoldCalculated = false;
	
    public Integer miningStrategy(){
        
        //Get the bottom-right cell and work top-down from there
        Integer i = GOLD_MINE.size() - 1;
        Integer j = GOLD_MINE.get(0).size() - 1;
        Integer rightBoundary = j;

        while(j >= 0){
            if(miningStrategyHelper(i, j, rightBoundary) > maxGoldSum){
                maxGoldSum = maxGold[i][j];
                exitLocation = j;
            }
            j--;
        }
        
        maxGoldCalculated = true;
        return maxGoldSum;

    }
    
    //Recurrence relation is maxGold[i][j] = GOLD_MINE.get(i).get(j) + Math.max(helper(i-1, j), helper(i-1, j-1), helper(i-1, j+1)
    private Integer miningStrategyHelper (Integer i, Integer j, Integer rightBoundary) {

        if(i < 0 || j < 0 || j > rightBoundary){ 
            return 0;
        } else if (maxGold[i][j] != 0){
            return maxGold[i][j];
        } else {
            maxGold[i][j]= GOLD_MINE[i][j] + Math.max(Math.max(miningStrategyHelper(i-1, j-1, rightBoundary), miningStrategyHelper(i-1, j+1, rightBoundary)), miningStrategyHelper(i-1, j, rightBoundary));
        }

        return maxGold[i][j];
        
    }
    
    //Return a string of the path taken, utilizing the already completed calculations to get the max gold possible
    public String getPathTaken () {
        if(!maxGoldCalculated) return 'Must call miningStrategy() first';
        
        String pathTaken = '';
        
        Integer i = GOLD_MINE.size() - 1;
        Integer j = exitLocation;
        Integer rightBoundary = GOLD_MINE.get(0).size() - 1;
        
        pathTaken += '[' + i + ']' + '[' + j + ']';
        
        while(i >= 1){
            i--;
            List<Integer> stepTaken = getNextStep(i,j, rightBoundary);
            i = stepTaken[0];
            j = stepTaken[1];
            
            pathTaken = '[' + i + ']' + '[' + j + ']' + '+' + pathTaken;
        }
        
        return pathTaken;
    }
    
    
    private List<Integer> getNextStep(Integer i, Integer j, Integer rightBoundary){
        
        Integer nextI = i;
        Integer nextJ = j;
            
        if (j + 1 <= rightBoundary && maxGold[nextI][j+1] >  maxGold[nextI][nextJ]) {
            nextJ = j+1;
        }
        
        if (j - 1 >= 0 && maxGold[nextI][j-1] > maxGold[nextI][nextJ]) {
            nextJ = j-1;
        }
        
        return new List<Integer>{nextI, nextJ};
                   
    }
        
}