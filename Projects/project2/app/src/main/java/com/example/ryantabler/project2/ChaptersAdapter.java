package com.example.ryantabler.project2;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageView;
import android.widget.TextView;

/**
 * Created by ryantabler on 5/1/18.
 */

// some code from https://www.raywenderlich.com/127544/android-gridview-getting-started

public class ChaptersAdapter extends BaseAdapter {
    private final Context mContext;
    private final Chapter[] chapters;

    // 1
    public ChaptersAdapter(Context context, Chapter[] chapters) {
        this.mContext = context;
        this.chapters = chapters;
    }

    // 2
    @Override
    public int getCount() {
        return chapters.length;
    }

    // 3
    @Override
    public long getItemId(int position) {
        return 0;
    }

    // 4
    @Override
    public Object getItem(int position) {
        return null;
    }

    // 5
    @Override
    public View getView(int position, View convertView, ViewGroup parent) {

        // 1
        final Chapter chapter = chapters[position];

        // 2
        if (convertView == null) {
            final LayoutInflater layoutInflater = LayoutInflater.from(mContext);
            convertView = layoutInflater.inflate(R.layout.linearlayout_chapter, null);
        }

        // 3
//        final ImageView imageView = (ImageView)convertView.findViewById(R.id.imageview_cover_art);
        final TextView chapterTextView = (TextView)convertView.findViewById(R.id.chapter_number);
//        final TextView authorTextView = (TextView)convertView.findViewById(R.id.textview_book_author);
//        final ImageView imageViewFavorite = (ImageView)convertView.findViewById(R.id.imageview_favorite);

        // 4
//        imageView.setImageResource(book.getImageResource());
        chapterTextView.setText(chapter.toString());
//        chapterTextView.setText(mContext.getString(Integer.parseInt(chapter.toString())));
//        authorTextView.setText(mContext.getString(book.getAuthor()));

        // make items square
        GridView grid = (GridView)parent;
        int size = grid.getColumnWidth();
        convertView.setLayoutParams(new GridView.LayoutParams(size, size));

        return convertView;
    }

}
