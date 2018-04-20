package com.example.ryantabler.lab6;

import android.app.ActionBar;
import android.app.Activity;
import android.app.ListActivity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

public class YearActivity extends ListActivity {

    private String year;

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
//        setContentView(R.layout);

        ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);

        Intent i = getIntent();
        year = i.getStringExtra("yearString");

        ListView movieListView = getListView();
//        Movie[] movieListToAdapt;
        ArrayAdapter<Movie> listAdapter;
        switch (year) {
            case "2010":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2010);
                break;
            case "2011":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2011);
                break;
            case "2012":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2012);
                break;
            case "2013":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2013);
                break;
            case "2014":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2014);
                break;
            case "2015":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2015);
                break;
            case "2016":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2016);
                break;
            case "2017":
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2017);
                break;
            default:
                listAdapter = new ArrayAdapter<Movie>(this, android.R.layout.simple_list_item_1, Movie.movies2010);
                break;
        }
        movieListView.setAdapter(listAdapter);
    }

    @Override
    protected void onListItemClick(ListView l, View v, int position, long id) {
        //        super.onListItemClick(l, v, position, id);
        Intent intent = new Intent(YearActivity.this, MovieActivity.class);
        Movie movie;
        switch (year) {
            case "2010":
                movie = Movie.movies2010[(int)id];
                break;
            case "2011":
                movie = Movie.movies2011[(int)id];
                break;
            case "2012":
                movie = Movie.movies2012[(int)id];
                break;
            case "2013":
                movie = Movie.movies2013[(int)id];
                break;
            case "2014":
                movie = Movie.movies2014[(int)id];
                break;
            case "2015":
                movie = Movie.movies2015[(int)id];
                break;
            case "2016":
                movie = Movie.movies2016[(int)id];
                break;
            case "2017":
                movie = Movie.movies2017[(int)id];
                break;
            default:
                movie = Movie.movies2010[(int)id];
                break;
        }
        intent.putExtra("movieTitle", movie.getName());
        intent.putExtra("movieImage", movie.getImageResourceID());
        intent.putExtra("rottentomatoesExtension", movie.getRTExtension());
        startActivity(intent);
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
                // open web page
                String url = "https://editorial.rottentomatoes.com/guide/100-best-animated-movies/4/";
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
