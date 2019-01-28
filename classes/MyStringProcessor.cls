/**
 * Created by User on 26.09.2018.
 */

public class MyStringProcessor implements StringProcessor {
        public static String addPrefix(String str) {
        String prefixString = '_';
        return prefixString + str;
    }

    public static String addPostfix(String str) {
        String postfixString = '...';
        return str + postfixString;
    }

    public static String removeWhitespaces(String str) {
        String noWhitespaces = str.deleteWhitespace();
        return noWhitespaces;
    }

    public void updateList(List<String> list1, List<String> list2) {
        for (Integer i=0; i<list1.size();i++) {
                 list2.add(addPrefix(list1[i]));
        }
        System.debug(''+list2);
    }
}