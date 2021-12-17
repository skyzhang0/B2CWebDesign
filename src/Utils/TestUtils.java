package Utils;

import java.util.Collection;

public class TestUtils {
    public static void printAll(Collection collection) {
        System.out.println("---------------- Print All -----------------");
        for (var i : collection) {
            System.out.println(i);
        }
    }
}