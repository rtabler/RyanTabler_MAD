package com.example.ryantabler.lab7;

/**
 * Created by ryantabler on 5/1/18.
 */

public class Recipe {
    private String name;
    private String filename;

    //constructor
    private Recipe(String name, String filename){
        this.name = name;
        this.filename = filename;
    }

    public static final Recipe[] allRecipes = {
            new Recipe("Marinara Sauce (slow cooker)", "img_4185"),
            new Recipe("Minestrone Soup (slow cooker)", "img_4187"),
            new Recipe("Chili (slow cooker)", "img_4174"),
            new Recipe("Chicken Noodle Soup (slow cooker)", "img_4175"),
            new Recipe("Meat Curry", "img_4177"),
            new Recipe("Beef Tofu Thing?", "img_4189"),
            new Recipe("Fettuccine Alfredo", "img_4190"),
            new Recipe("Potatoes + Meatballs", "img_4186"),
            new Recipe("Macaroni & Cheese", "img_4188"),
    };

    public String getName() { return name; }
    public String getFilename() { return filename; }
    public Recipe[] getAllRecipes() { return allRecipes; }

    public String toString(){
        return this.getName();
    }
}
