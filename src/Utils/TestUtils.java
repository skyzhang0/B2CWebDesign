package Utils;

import Entity.User;

import java.util.Collection;
import java.util.List;

public class TestUtils {
    public static void printAll(Collection collection) {
        System.out.println("---------------- Print All -----------------");
        for (var i : collection) {
            System.out.println(i);
        }
    }

    public static void initDB() {

    }
}