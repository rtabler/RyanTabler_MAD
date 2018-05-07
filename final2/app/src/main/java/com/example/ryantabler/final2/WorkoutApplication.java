package com.example.ryantabler.final2;

import android.app.Application;

import io.realm.Realm;
import io.realm.RealmConfiguration;

/**
 * Created by ryantabler on 5/6/18.
 */

public class WorkoutApplication extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        //initialize Realm
        Realm.init(this);
        //define the configuration for realm
        RealmConfiguration realmConfig = new RealmConfiguration.Builder().build();
        //set the default realm configuration
        Realm.setDefaultConfiguration(realmConfig);
    }
}
