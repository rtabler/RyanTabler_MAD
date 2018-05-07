package com.example.ryantabler.final2;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import io.realm.Realm;
import io.realm.RealmResults;

public class WorkoutTypeActivity extends Activity {

    private Realm realm;
    Workout[] workouts;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_workout_type);

        // get intent and data
        Intent intent = getIntent();
        int selectedIndex = intent.getIntExtra("selected",0);
        Log.d("selected", String.valueOf(selectedIndex));

        // realm
        realm = Realm.getDefaultInstance();
        RealmResults<Workout> workouts = realm.where(Workout.class).findAll();

        //define an array adapter
//        ArrayAdapter<Workout> workoutListAdapter;
//        switch (selectedIndex) {
//            case 0:
//                workouts = Workout.cardioWorkouts;
//                break;
//            case 1:
//                workouts = Workout.strengthWorkouts;
//                break;
//            case 2:
//                workouts = Workout.flexibilityWorkouts;
//                break;
//            default:
//                workouts = Workout.cardioWorkouts;
//                break;
//        }
        final WorkoutAdapter workoutListAdapter = new WorkoutAdapter(this, workouts);

        // get the listview
        ListView workoutListView = (ListView) findViewById(R.id.workoutList);
        workoutListView.setAdapter(workoutListAdapter);

        workoutListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//                Uri uri = Uri.parse(workouts[position].getUrl());
//                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
//                intent.putExtra("selected",)
//                startActivity(intent);
            }
        });
    }
}
