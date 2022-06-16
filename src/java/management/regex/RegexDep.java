/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package management.regex;

import java.util.regex.Pattern;

/**
 *
 * @author lehon
 */
public class RegexDep {

    public static boolean checkDepName(String name) {

        boolean check = name.matches("[a-zA-Z][a-zA-Z ]*");
        if ((name.length() > 30 || name.length() < 4) || (check == false)) {
            return false;
        }
        return true;
    }

    public static String removeAllTrim(String name) {
        return name.replaceAll("\\s\\s+", " ").trim().toLowerCase();
    }

    public static boolean checkDepDes(String des) {
        if (des.length() < 8 || des.length() > 40) {
            return false;
        }
        return true;
    }

    public static boolean checkDepLoc(String location) {
        if (location.length() < 3 || location.length() > 10) {
            return false;
        }
        return true;
    }

    public static boolean checkDepFieldNull(String name, String des, String loc) {
        if (name.equals("") || name == null || des.equals("") || des == null || loc.equals("") || loc == null) {
            return true;
        }
        return false;
    }

    public static boolean checkDepValidation(String name, String des, String location) {
        if (checkDepName(name) && checkDepDes(des) && checkDepLoc(location)) {
            return true;
        }
        return false;
    }

}
