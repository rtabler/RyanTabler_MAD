package com.example.ryantabler.lab7;


import android.content.Context;
import android.os.Bundle;
import android.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class RecipeListFragment extends Fragment implements AdapterView.OnItemClickListener {

    public RecipeListFragment() {
        // Required empty public constructor
    }

    @Override
    public void onStart() {
        super.onStart();
        View view = getView();
        if (view != null){
            ListView recipesListView = (ListView) view.findViewById(R.id.recipes_list_view);
            ArrayAdapter<Recipe> listAdapter = new ArrayAdapter<Recipe>(getActivity(), android.R.layout.simple_list_item_1, Recipe.allRecipes);
            recipesListView.setAdapter(listAdapter);

            recipesListView.setOnItemClickListener(this);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_recipe_list, container, false);
    }


    //create interface
    interface RecipeListListener {
        void itemClicked(long id);
    }

    // create listener
    RecipeListListener listener;

    @Override public void onAttach(Context context){
        super.onAttach(context);
        //attaches the context to the listener
        listener = (RecipeListListener) context;
    }

    @Override
    public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
//        Log.d("REACHED","RecipeListFragment.onItemClick()");
        if (listener != null) {
            listener.itemClicked(id);
        }
    }
}
