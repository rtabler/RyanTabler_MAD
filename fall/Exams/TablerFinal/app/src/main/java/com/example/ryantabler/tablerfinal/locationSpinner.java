package com.example.ryantabler.tablerfinal;

import android.app.Activity;
import android.os.Bundle;
import android.widget.Spinner;
import android.widget.ArrayAdapter;

/**
 * Created by ryantabler on 12/17/17.
 */

public class locationSpinner extends Activity {
    private String[] arraySpinner;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
//        setContentView(R.layout.main);

        this.arraySpinner = new String[] {
                "The Hill", "29th Street", "Pearl Street"
        };
        Spinner s = (Spinner) findViewById(R.id.locationSpinner);
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_spinner_item, arraySpinner);
        s.setAdapter(adapter);
    }
}
