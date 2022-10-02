public class LongestCommonSubsequence {
    
    //TODO Add in caching to make solution DP and not just recursion, and have multiple test cases. Also do a method for returning the string itself
    
    //For this pair of string, there are 1298 method calls when regular recursion is used, and only 66 method calls when DP caching is added!
    public static final String S1 = 'abdacbab';
    public static final String S2 = 'acebfca';

    //For this pair of strings, there are only 497 method calls when memoization (caching) is used
    public static final String S3 = 'iflikefradishesf';
    public static final String S4 = 'isglikeradisghes';
    
    public static final String S5 = 'paired-in-time';
    public static final String S6 = 'pali-india';
    
    public Map<String, Integer> subseqLengthMap = new Map<String, Integer>();
    public Integer methodCalls = 0;
    
    //T(n) = |keys| * cost of solving a subproblem = |nm| * O(1) = O(nm)
    public Integer calculateSubsequenceLength(String first, String second){
        
        methodCalls++;
        if(subseqLengthMap.containsKey(first + '&' + second)){
            return subseqLengthMap.get(first + '&' + second);
        } else if (subseqLengthMap.containsKey(second + '&' + first)){
            return subseqLengthMap.get(second + '&' + first);
        }
        
        if(first.length () < 1 || second.length() < 1) return 0;
        
        String lastCharFirstString = first.substring(first.length() - 1);
        String lastCharSecondString = second.substring(second.length() - 1);
        
        if(first.length() > 1 && second.length() > 1){
            if(lastCharFirstString == lastCharSecondString){
                subseqLengthMap.put(first + '&' + second, 1 + calculateSubsequenceLength(first.substring(0, first.length() - 1), second.substring(0, second.length() - 1)));
            } else {
                subseqLengthMap.put(first + '&' + second, MATH.max(calculateSubsequenceLength(first.substring(0, first.length() - 1), second), 
                                                                   calculateSubsequenceLength(first, second.substring(0, second.length() - 1))));
            }  
        } else if(first.length() >= 1){
            if(lastCharFirstString == lastCharSecondString){
                subseqLengthMap.put(first + '&' + second, 1);
            } else {
             	subseqLengthMap.put(first + '&' + second, calculateSubsequenceLength(first.substring(0, first.length() - 1), second));   
            }
        } else if(second.length() >= 1){
            if(lastCharFirstString == lastCharSecondString){
                subseqLengthMap.put(first + '&' + second, 1);
            } else {
                subseqLengthMap.put(first + '&' + second, calculateSubsequenceLength(first, second.substring(0, second.length() - 1)));
            }
        }      
        
        return subseqLengthMap.get(first + '&' + second);
    
    }
    
    //T(n) = |nm| + |nm| + |nm| + |nm| = c * nm = O(nm) 
    public String calculateSubsequenceString(String first, String second){
        
        //Two matching matrices have to be created to avoid out of bound errors when using subsequence helper
        List<List<Integer>> firstMatchingMatrix = createMatchingMatrix(first, second); //O(nm)
        List<List<Integer>> secondMatchingMatrix = createMatchingMatrix(second, first);//O(nm)
        
        String firstAsColumn = subsequenceHelper(first, second, firstMatchingMatrix);//O(nm)
        String secondAsColumn = subsequenceHelper(second, first, secondMatchingMatrix);//O(nm)
        
        if(firstAsColumn.length() >= secondAsColumn.length()){
           return firstAsColumn; 
        } else {
           return secondAsColumn; 
        }     
        
    }
    
    private List<List<Integer>> createMatchingMatrix(String first, String second){
        List<List<Integer>> matchingMatrix = new List<List<Integer>>();
        
        for(Integer i=0; i < first.length(); i++){ // O(ij)
            List<Integer> tmpList = new List<Integer>(); 
            for(Integer j=0; j < second.length(); j++){
                String charInFirstString = first.substring(i, i+1);
                String charInSecondString = second.substring(j, j+1);
                if(charInFirstString == charInSecondString){
                    tmpList.add(1);
                } else {
                    tmpList.add(0);
                }
                
            }
            matchingMatrix.add(tmpList);
        }
        
        return matchingMatrix;
    }
    
    private String subsequenceHelper(String first, String second, List<List<Integer>> matchingMatrix){
        
        String toReturn = '';
        Integer minJ = 0;
        
        for(Integer i = 0; i < first.length(); i++){
            for(Integer j = minJ; j < second.length(); j++){
                if(matchingMatrix.get(i).get(j) == 1){
                    toReturn += first.substring(i, i+1);
                    minJ = j + 1;
                    break;
                }
            }
        }
        
        return toReturn;
    }

}