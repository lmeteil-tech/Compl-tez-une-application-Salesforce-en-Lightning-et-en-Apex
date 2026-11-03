public with sharing class StringListTest {
    public static List<String> generateStringList (Integer NbElement) {
        List<String> resultat = new List<String>();
          
        for(Integer i=0;i<nbElement;i++){
            resultat.add('Test '+i);
        
        }
        return resultat;
    }}