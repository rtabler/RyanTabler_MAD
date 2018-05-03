package com.example.ryantabler.lab7;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ImageView;

public class MainActivity extends Activity implements RecipeListFragment.RecipeListListener {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    @Override
    public void itemClicked(long id) {
        final Recipe[] allRecipes = Recipe.allRecipes;
        Recipe selectedRecipe = allRecipes[(int)id];

        Log.d("REACHED","itemClicked()");

        RecipeCardFragment recipeCardFrag = (RecipeCardFragment)getFragmentManager().findFragmentById(R.id.recipe_card_frag);
        Log.d("getFilename():", selectedRecipe.getFilename());
        recipeCardFrag.setImage(selectedRecipe.getFilename());
    }
}
