package com.example.ryantabler.project2;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
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
    private int translationIndex;
    Translation[] allTranslations;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_text);

        // sort out data passed to here
        Intent intent = getIntent();
        // chapter
        chapterNumber = intent.getIntExtra("chapterNumber",1);
        allChapters = Chapter.allChaptersStatic;
        Chapter thisChapter = allChapters[chapterNumber-1];
        // translation
        translationIndex = 0;
        allTranslations = Translation.getAllTranslations();
        Translation thisTranslation = allTranslations[translationIndex];

        // set title
        TextView chapterTitleNumber = findViewById(R.id.chapter_title_number);
        chapterTitleNumber.setText(thisChapter.toString());

        // set translation button layout
        Button toggleTranslationButton = (Button) findViewById(R.id.toggle_translation_button);
        toggleTranslationButton.setHeight(chapterTitleNumber.getHeight());
        toggleTranslationButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Button thisButtonView = (Button)v;
                translationIndex = (translationIndex + 1) % allTranslations.length;
                setViewAccordingToTranslation();
            }
        });

        // set text layout
        EditText chapterTextBody = (EditText) findViewById(R.id.chapter_text_body);
//        chapterTextBody.setKeyListener(null);
        chapterTextBody.setFocusable(false);
        chapterTextBody.setCursorVisible(false);

        // set button and text content
        setViewAccordingToTranslation();
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        EditText chapterTextBody = (EditText) findViewById(R.id.chapter_text_body);
        Log.d("textHeight",String.valueOf(chapterTextBody.getHeight()));
        overridePendingTransition(R.anim.left_slide_in,R.anim.left_slide_out);
        finish();
    }

    public void setViewAccordingToTranslation() {

        // button
        Button toggleTranslationButton = (Button) findViewById(R.id.toggle_translation_button);
        toggleTranslationButton.setText("Translation:\n"+allTranslations[translationIndex].getDisplayString());

        // edittext
        int id = getResources().getIdentifier(allTranslations[translationIndex].getFilenameString()+String.valueOf(chapterNumber),"raw",getPackageName());
        // help from https://stackoverflow.com/questions/4087674/android-read-text-raw-resource-file
        InputStream inputStream = getResources().openRawResource(id);
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
        String bodyText = "";
        try {
            String line = reader.readLine();
            while (line != null) {
                bodyText = bodyText.concat(line);
                bodyText = bodyText.concat("\n");
                line = reader.readLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        EditText chapterTextBody = (EditText) findViewById(R.id.chapter_text_body);
        chapterTextBody.setText(bodyText);
    }
}
