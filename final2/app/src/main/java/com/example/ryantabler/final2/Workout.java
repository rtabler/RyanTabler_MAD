package com.example.ryantabler.final2;

/**
 * Created by ryantabler on 5/6/18.
 */

import io.realm.RealmObject;
import io.realm.annotations.PrimaryKey;
import io.realm.annotations.Required;

public class Workout extends RealmObject {

    @Required
    @PrimaryKey
    private String id;
    public String getId() { return id; };
    public void setId(String id) { this.id = id; };

    private String name;
    private String url;

    public Workout() {
        this.name = "";
        this.url = "";
    };
    public Workout(String name, String url) {
        this.name = name;
        this.url = url;
    }

    public static Workout[] cardioWorkouts = {
            new Workout("running","https://www.runnersworld.com/running-tips"),
            new Workout("cycling","http://www.cyclingnews.com/")
    };
    public static Workout[] strengthWorkouts = {
    };
    public static Workout[] flexibilityWorkouts = {
    };

    public String getName() {
        return this.name;
    };
    public String getUrl() {
        return this.url;
    };

    @Override
    public String toString() {
        return this.name;
    }
}
