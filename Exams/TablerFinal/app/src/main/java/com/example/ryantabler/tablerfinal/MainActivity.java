package com.example.ryantabler.tablerfinal;

import android.content.pm.PackageManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.RadioGroup;
import android.widget.Spinner;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.ToggleButton;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        RadioGroup typeRadioGroup = (RadioGroup)findViewById(R.id.radioGroup);

        ToggleButton fillingToggle = (ToggleButton)findViewById(R.id.fillingToggle);
        View.OnClickListener onToggleFilling = new View.OnClickListener() {
            public void onClick(View view) {
                toggleFilling(view);
            }
        };

        Spinner locationSpinner = (Spinner)findViewById(R.id.locationSpinner);


        Button buildBurritoButton = (Button)findViewById(R.id.generateBurritoButton);
        View.OnClickListener onBuildBurrito = new View.OnClickListener() {
            public void onClick(View view) {
                buildBurrito(view);
            }
        };
        buildBurritoButton.setOnClickListener(onBuildBurrito);

    }

    public void toggleFilling(View view) {

    }
    public void buildBurrito(View view) {
        String results = "You would like a ";

        ToggleButton fillingToggle = (ToggleButton)findViewById(R.id.fillingToggle);
        if (fillingToggle.isChecked()) {
            results += "veggie ";
        } else {
            results += "meat ";
        }

        RadioGroup typeRadioGroup = (RadioGroup)findViewById(R.id.radioGroup);
        Integer typeId = typeRadioGroup.getCheckedRadioButtonId();
        if (typeId == R.id.typeButton1) {
            results += "burrito at ";
        } else if (typeId == R.id.typeButton2) {
            results += "taco at ";
        } else {
            results += "enchilada (...? you didn't say) at ";
        }

        Spinner locationSpinner = (Spinner)findViewById(R.id.locationSpinner);
        String locationString = locationSpinner.getSelectedItem().toString();
        if (locationString.equals("The Hill")) {
            results += "Illegal Pete's.";
        } else if (locationString.equals("29th Street")) {
            results += "Chipotle.";
        } else if (locationString.equals("Pearl Street")) {
            results += "Bartaco.";
        } else {
            results += "...hell? How did you manage to deselect a spinner???";
            System.out.println(locationString);
        }

        String bonusResults = "";

        Switch glutenSwitch = (Switch)findViewById(R.id.glutenSwitch);
        if (glutenSwitch.isChecked()) {
            bonusResults += " You requested gluten-free, so we suggest requesting a corn tortilla. ";
        }

        bonusResults += "Also, you requested: ";
        CheckBox checkboxSalsa = (CheckBox)findViewById(R.id.checkboxSalsa);
        CheckBox checkboxCheese = (CheckBox)findViewById(R.id.checkboxCheese);
        CheckBox checkboxSourcream = (CheckBox)findViewById(R.id.checkboxSourcream);
        CheckBox checkboxGuacamole = (CheckBox)findViewById(R.id.checkboxGuacamole);
        if (checkboxSalsa.isChecked()) { bonusResults += "salsa "; }
        if (checkboxCheese.isChecked()) { bonusResults += "cheese "; }
        if (checkboxSourcream.isChecked()) { bonusResults += "sour-cream "; }
        if (checkboxGuacamole.isChecked()) { bonusResults += "guacamole "; }
        bonusResults += ".";

        EditText burritoName = (EditText)findViewById(R.id.burritoName);
        if (burritoName.getText().length() > 0) {
            bonusResults += " Name for your burrito: "+burritoName.getText();
        }

        TextView burritoDetailText = findViewById(R.id.burritoDetails);
        burritoDetailText.setText(results+bonusResults);
    }
}
