package com.example.ryantabler.final2;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListAdapter;
import android.widget.TextView;

import io.realm.OrderedRealmCollection;
import io.realm.RealmBaseAdapter;

/**
 * Created by ryantabler on 5/6/18.
 */

public class WorkoutAdapter extends RealmBaseAdapter<Workout> implements ListAdapter {
    ViewHolder viewHolder;

    private WorkoutTypeActivity activity;

    private static class ViewHolder {
        TextView nameText;
    }

    WorkoutAdapter(WorkoutTypeActivity activity, OrderedRealmCollection<Workout> data) {
        super(data);
        this.activity = activity;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        if (convertView == null) {
            convertView = LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.workout_type_row, parent, false);
            viewHolder = new ViewHolder();
            viewHolder.nameText = (TextView) convertView.findViewById(R.id.nameText);
            convertView.setTag(viewHolder);
        } else {
            viewHolder = (ViewHolder) convertView.getTag();
        }
        if (adapterData != null) {
            Workout workout = adapterData.get(position);
            viewHolder.nameText.setText(workout.getName());
        }
        return convertView;
    }

    private View.OnClickListener listener = new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            int position = (Integer) view.getTag();
            //        if (adapterData != null) {
            //            Workout workout = adapterData.get(position);
            //            activity.changeBookRead(book.getId()); }
            //        }
        }
    };
}
