package ch.battino;

import java.util.HashMap;

public class Morse {
    private static HashMap<String, String> encodingMap = new HashMap<String, String>();
    private static HashMap<String, String> decodingMap = new HashMap<String, String>();
    static {

        encodingMap.put("A",".-");
        encodingMap.put("B","-...");
        encodingMap.put("C","-.-.");
        encodingMap.put("D","-..");
        encodingMap.put("E",".");
        encodingMap.put("F","..-.");
        encodingMap.put("G","--.");
        encodingMap.put("H","....");
        encodingMap.put("I","..");
        encodingMap.put("J",".---");
        encodingMap.put("K","-.-");
        encodingMap.put("L",".-..");
        encodingMap.put("M","--");
        encodingMap.put("N","-.");
        encodingMap.put("O","---");
        encodingMap.put("P",".--.");
        encodingMap.put("Q","--.-");
        encodingMap.put("R",".-.");
        encodingMap.put("S","...");
        encodingMap.put("T","-");
        encodingMap.put("U","..-");
        encodingMap.put("V","...-");
        encodingMap.put("W",".--");
        encodingMap.put("X","-..-");
        encodingMap.put("Y","-.--");
        encodingMap.put("Z","--..");
        encodingMap.put("0","-----");
        encodingMap.put("1",".----");
        encodingMap.put("2","..---");
        encodingMap.put("3","...--");
        encodingMap.put("4","....-");
        encodingMap.put("5",".....");
        encodingMap.put("6","-....");
        encodingMap.put("7","--...");
        encodingMap.put("8","---..");
        encodingMap.put("9","----.");
        encodingMap.put(".",".-.-.-");
        encodingMap.put(",","--..--");
        encodingMap.put("?","..--..");
        encodingMap.put("/","-..-.");
        encodingMap.put("-","-....-");
        encodingMap.put("(","-.--.");
        encodingMap.put(")","-.--.-");
        encodingMap.put(" ","/");
        decodingMap.put(".-","A");
        decodingMap.put("-...","B");
        decodingMap.put("-.-.","C");
        decodingMap.put("-..","D");
        decodingMap.put(".","E");
        decodingMap.put("..-.","F");
        decodingMap.put("--.","G");
        decodingMap.put("....","H");
        decodingMap.put("..","I");
        decodingMap.put(".---","J");
        decodingMap.put("-.-","K");
        decodingMap.put(".-..","L");
        decodingMap.put("--","M");
        decodingMap.put("-.","N");
        decodingMap.put("---","O");
        decodingMap.put(".--.","P");
        decodingMap.put("--.-","Q");
        decodingMap.put(".-.","R");
        decodingMap.put("...","S");
        decodingMap.put("-","T");
        decodingMap.put("..-","U");
        decodingMap.put("...-","V");
        decodingMap.put(".--","W");
        decodingMap.put("-..-","X");
        decodingMap.put("-.--","Y");
        decodingMap.put("--..","Z");
        decodingMap.put("-----","0");
        decodingMap.put(".----","1");
        decodingMap.put("..---","2");
        decodingMap.put("...--","3");
        decodingMap.put("....-","4");
        decodingMap.put(".....","5");
        decodingMap.put("-....","6");
        decodingMap.put("--...","7");
        decodingMap.put("---..","8");
        decodingMap.put("----.","9");
        decodingMap.put(".-.-.-",".");
        decodingMap.put("--..--",",");
        decodingMap.put("..--..","?");
        decodingMap.put("-..-.","/");
        decodingMap.put("-....-","-");
        decodingMap.put("-.--.","(");
        decodingMap.put("-.--.-",")");
        decodingMap.put("/"," ");
    }


    // actual code starts here
    public static String encode(String string) {
        char[] charArray = string.toUpperCase().toCharArray();
        String []stringArray = new String[charArray.length];
        for(int i = 0; i < charArray.length; i++)
            stringArray[i] = String.valueOf(charArray[i]);
        StringBuilder encodedStringBuilder = new StringBuilder();
        for (int i = 0; i < stringArray.length; i++) {
            encodedStringBuilder.append(encodingMap.get(stringArray[i])+" ");
        }
        encodedStringBuilder.deleteCharAt(encodedStringBuilder.length()-1);
        return encodedStringBuilder.toString();
    }
    public static String decode(String string) {
        String [] stringArray = string.split(" ");
        for (String c:stringArray)
            System.out.println(c);
        StringBuilder decodedStringBuilder = new StringBuilder();
        for (int i = 0; i < stringArray.length; i++) {
            decodedStringBuilder.append(decodingMap.get(stringArray[i]));
        }
        return decodedStringBuilder.toString();
    }


}
