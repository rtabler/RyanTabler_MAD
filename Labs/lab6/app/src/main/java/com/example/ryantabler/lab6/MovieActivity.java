package com.example.ryantabler.lab6;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
//import android.R;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ImageView;
import android.widget.TextView;

public class MovieActivity extends Activity {

    String rottentomatoesExtension;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_movie);

        ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);

        // set title
        String movieTitle = (String) getIntent().getExtras().get("movieTitle");
        TextView movieTitleTextView = findViewById(R.id.movieTitle);
//        Log.d(".",movieTitle);
        movieTitleTextView.setText(movieTitle);

        // set image
        int movieImage = (int) getIntent().getExtras().get("movieImage");
        ImageView movieImageView = findViewById(R.id.movieImageView);
//        Log.d(".", String.valueOf(movieImage));
        movieImageView.setImageResource(movieImage);

        // prepare rotten tomatoes linking
        rottentomatoesExtension = (String) getIntent().getExtras().get("rottentomatoesExtension");
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // inflate menu to add items to app bar
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return super.onCreateOptionsMenu(menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.open_RT:
                String url = "https://www.rottentomatoes.com" + rottentomatoesExtension;
                Intent i = new Intent(Intent.ACTION_VIEW);
                i.setData(Uri.parse(url));
                startActivity(i);
                return true;
            case android.R.id.home:
                this.finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
