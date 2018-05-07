package com.example.ryantabler.final2;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import io.realm.Realm;

public class MainActivity extends Activity {

    private Realm realm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        ArrayAdapter<WorkoutType> workoutTypeAdapter = new ArrayAdapter<WorkoutType>(this, android.R.layout.simple_list_item_1, WorkoutType.allWorkoutTypes);

        // get the listview
        ListView listViewWorkoutTypes = (ListView) findViewById(R.id.listWorkoutTypes);
        listViewWorkoutTypes.setAdapter(workoutTypeAdapter);

        listViewWorkoutTypes.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Log.d("Clicked!", String.valueOf(position));
                Intent intent = new Intent(MainActivity.this, WorkoutTypeActivity.class);
                intent.putExtra("selected", position);
                startActivity(intent);
            }
        });

        // create listener
//        AdapterView.OnItemClickListener itemClickListener = new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView<?> listView, View view, int position, long id) {
//                String yearString = (String) listView.getItemAtPosition(position);
//                // create intent
//                Intent intent = new Intent(MainActivity.this, YearActivity.class);
//                // add year data to Intent, to be used by YearActivity
//                intent.putExtra("yearString", yearString);
//                // start intent
//                startActivity(intent);
//            }
//        };

//        listViewWorkoutTypes.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//
//            }
//        });
    }
}
