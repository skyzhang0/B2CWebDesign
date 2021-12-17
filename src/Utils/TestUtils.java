package Utils;

import Entity.User;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class TestUtils {
    public static void printAll(Collection collection) {
        System.out.println("---------------- Print All -----------------");
        for (var i : collection) {
            System.out.println(i);
        }
    }
}