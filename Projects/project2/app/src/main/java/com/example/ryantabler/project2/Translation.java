package com.example.ryantabler.project2;

/**
 * Created by ryantabler on 5/3/18.
 */

public class Translation {
    private String filenameString;
    private String displayString;

    private Translation(String filenameString, String displayString) {
        this.filenameString = filenameString;
        this.displayString = displayString;
    }

    private static Translation[] allTranslations = {
            new Translation("fengenglish","Feng/English"),
            new Translation("mitchell","Mitchell")
    };
    public static Translation[] getAllTranslations() {
        return allTranslations;
    }

    public String getFilenameString() { return filenameString; }
    public String getDisplayString() { return displayString; }
}
