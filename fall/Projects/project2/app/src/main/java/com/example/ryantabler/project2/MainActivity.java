package com.example.ryantabler.project2;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.GridLayout;
import android.widget.TextView;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;

public class MainActivity extends AppCompatActivity {

    ArrayList<Timestamp> times = new ArrayList<Timestamp>();
//    long[] times = new long[6];
//    int timesIndex = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        Button tapButton = (Button) findViewById(R.id.tapButton);
        Button clearButton = (Button) findViewById(R.id.resetButton);

        new GridLayout.LayoutParams();
//        tapButton.setLayoutParams();


        View.OnClickListener onTap = new View.OnClickListener(){
            public void onClick(View view){
                enterTap(view);
            }
        };
        tapButton.setOnClickListener(onTap);
        View.OnClickListener onClear = new View.OnClickListener() {
            public void onClick(View view) {
                clearCounter(view);
            }
        };
        clearButton.setOnClickListener(onClear);
    }

    public void enterTap(View view){
        Button tapButton = (Button) findViewById(R.id.tapButton);
        TextView bpmNumberText = (TextView) findViewById(R.id.bpmNumberText);
        TextView hzNumberText = (TextView) findViewById(R.id.hzNumberText);

        Timestamp nowTime = new Timestamp((long)System.currentTimeMillis());

        if (times.size() > 0) {
            System.out.println("TIME SINCE LAST TAP:");
            System.out.println(Long.toString(nowTime.getTime() - times.get(times.size()-1).getTime()));
            if (nowTime.getTime() - times.get(times.size()-1).getTime() >= 3000) {
                times.clear();
                bpmNumberText.setText("Inf");
                hzNumberText.setText("( Inf ");
            }
        }
        while (times.size() > 7) {
            times.remove(0);
        }

        times.add(nowTime);

        long diffSum = 0;
        System.out.println("TIME DIFFS:");
        for (int i=0; i<times.size()-1; i++) {
            diffSum += (times.get(i+1).getTime() - times.get(i).getTime());
            System.out.println(Long.toString(times.get(i+1).getTime() - times.get(i).getTime()));
        }
        diffSum = (times.get(times.size()-1).getTime() - times.get(0).getTime());

        if (times.size() <= 1) {
            bpmNumberText.setText("Inf");
            hzNumberText.setText("( Inf ");
        } else {
            double avgDiff = (double) diffSum / (double) (times.size() - 1); // milliseconds per beat
            System.out.println("AVERAGE:");
            System.out.println(Double.toString(avgDiff));
            avgDiff = avgDiff / 1000.0; // seconds per beat
            double hz = 1.0 / avgDiff;
            avgDiff = avgDiff / 60.0; // minutes per beat
            double bpm = 1.0 / avgDiff; // beats per minute

            bpmNumberText.setText(String.format("%.1f", bpm));
            hzNumberText.setText(String.format("( %.2f ", hz));
        }
    }
    public void clearCounter(View view) {
        System.out.println("RESETTING!!!!");
        TextView bpmNumberText = (TextView) findViewById(R.id.bpmNumberText);
        TextView hzNumberText = (TextView) findViewById(R.id.hzNumberText);
        times.clear();
        bpmNumberText.setText("Inf");
        hzNumberText.setText("( Inf ");
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        System.out.println("I'm DONE");
    }
}
