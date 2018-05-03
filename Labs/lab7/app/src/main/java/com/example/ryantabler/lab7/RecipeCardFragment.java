package com.example.ryantabler.lab7;


import android.content.res.Resources;
import android.os.Bundle;
import android.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.ListView;


/**
 * A simple {@link Fragment} subclass.
 */
public class RecipeCardFragment extends Fragment {

    private String imageName;

    public RecipeCardFragment() {
        // Required empty public constructor
    }

    @Override
    public void onStart() {
        super.onStart();

        View view = getView();

        if (view != null) {
            ImageView recipeCardImage = view.findViewById(R.id.recipe_card_image_view);
            recipeCardImage.setImageResource(R.drawable.img_default);
        }
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_recipe_card, container, false);
    }

    public void setImage(String img) {
        // ImageView to change
        View view = getView();
        ImageView recipeCardImage = view.findViewById(R.id.recipe_card_image_view);

        // set it
        Resources res = getResources();
        int resID = res.getIdentifier(img, "drawable", getActivity().getPackageName());
        recipeCardImage.setImageResource(resID);
    }
}
