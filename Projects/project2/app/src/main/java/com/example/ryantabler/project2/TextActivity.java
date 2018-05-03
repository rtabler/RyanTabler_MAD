package com.example.ryantabler.project2;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

// Helpful bash script lines I used:
// https://www.garron.me/en/bits/rename-files-from-uppercase-to-lowercase.html
// https://unix.stackexchange.com/questions/104881/remove-particular-characters-from-a-variable-using-bash

public class TextActivity extends AppCompatActivity {

    private int chapterNumber;
    Chapter[] allChapters;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_text);

        Intent intent = getIntent();
        chapterNumber = intent.getIntExtra("chapterNumber",1);

        Log.d("CHAPTERNUMBER:", String.valueOf(chapterNumber));

        allChapters = Chapter.allChaptersStatic;
        Chapter thisChapter = allChapters[chapterNumber-1];


        // set title
        TextView chapterTitleNumber = findViewById(R.id.chapter_title_number);
        chapterTitleNumber.setText(thisChapter.toString());

        // set translation button
        Button toggleTranslationButton = (Button) findViewById(R.id.toggle_translation_button);
        toggleTranslationButton.setHeight(chapterTitleNumber.getHeight());
        toggleTranslationButton.setText("Transl:\nFeng/English");

        // set text body
        Log.d("filename","fengenglish"+String.valueOf(chapterNumber));
        int id = getResources().getIdentifier("fengenglish"+String.valueOf(chapterNumber),"raw",getPackageName());
        InputStream inputStream = getResources().openRawResource(id);
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        String bodyText = "";
        try {
            String line = reader.readLine();
            while (line != null) {
                bodyText = bodyText.concat(line);
                bodyText = bodyText.concat("\n");
                Log.d("ITERATE",line);
                line = reader.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        EditText chapterTextBody = (EditText) findViewById(R.id.chapter_text_body);
        chapterTextBody.setText(bodyText);
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        overridePendingTransition(R.anim.left_slide_in,R.anim.left_slide_out);
        finish();
    }
}
