package com.example.ryantabler.lab5;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;

import org.w3c.dom.Text;


public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        SeekBar factorSlider = findViewById(R.id.factorSlider);
        final TextView factorMeter = findViewById(R.id.factorMeter);
        factorSlider.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                factorMeter.setText(Integer.toString(progress+1));
            }
            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }
            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
    }

    public void update(View view) {
//        TextView booText = findViewById(R.id.message);
        EditText enterText = findViewById(R.id.enterText);
        Spinner chooseSpinner = findViewById(R.id.chooseSpinner);
        SeekBar factorSlider = findViewById(R.id.factorSlider);
        CheckBox optionsAdd1 = findViewById(R.id.optionsAdd1);
        CheckBox optionsAdd10 = findViewById(R.id.optionsAdd10);
        CheckBox optionsAdd100 = findViewById(R.id.optionsAdd100);
        CheckBox optionsSquare = findViewById(R.id.optionsSquare);
        Switch negateSwitch = findViewById(R.id.negateSwitch);
        Button updateButton = findViewById(R.id.updateButton);
        TextView resultText = findViewById(R.id.resultText);

        resultText.setText(Integer.toString(factorSlider.getProgress()));
    }
}
