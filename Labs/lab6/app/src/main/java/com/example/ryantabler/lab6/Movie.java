package com.example.ryantabler.lab6;

/**
 * Created by ryantabler on 4/19/18.
 */

public class Movie {
    private String name;
    private int imageResourceID;
    private String imageUrl;
    private String RTExtension;

    private Movie(String movieName, int id, String rottenTomatoesExtension) {
        this.name = movieName;
        this.imageResourceID = id;
        this.RTExtension = rottenTomatoesExtension;
    }

    public static final Movie[] movies2010 = {
        new Movie("Toy Story 3", R.drawable.toy_story_3, "/m/toy_story_3"),
        new Movie("How to Train Your Dragon", R.drawable.httyd, "/m/how_to_train_your_dragon"),
        new Movie("The Illusionist", R.drawable.lillusioniste, "/m/the_illusionist_2009")
    };
    public static final Movie[] movies2011 = {
        new Movie("Rango", R.drawable.rango, "/m/rango"),
        new Movie("A Cat in Paris", R.drawable.cat_in_paris, "/m/a_cat_in_paris"),
        new Movie("Chico & Rita", R.drawable.chico_rita, "/m/chico_and_rita"),
        new Movie("Kung Fu Panda 2", R.drawable.kung_fu_panda, "/m/kung_fu_panda_2"),
        new Movie("Puss in Boots", R.drawable.puss_in_boots, "/m/1209933_puss_in_boots")
    };
    public static final Movie[] movies2012 = {
        new Movie("Brave", R.drawable.brave, "/m/brave_2012"),
        new Movie("Frankenweenie", R.drawable.frankenweenie, "/m/frankenweenie_2012"),
        new Movie("ParaNorman", R.drawable.paranorman, "/m/paranorman"),
        new Movie("The Pirates! Band of Misfits", R.drawable.pirates_band_of_mistfits, "/m/the_pirates_band_of_misfits"),
        new Movie("Wreck-It Ralph", R.drawable.wreck_it_ralph, "/m/wreck_it_ralph")
    };
    public static final Movie[] movies2013 = {
            new Movie("Frozen", R.drawable.frozen, "/m/frozen_2013"),
            new Movie("The Croods", R.drawable.the_croods, "/m/the_croods"),
            new Movie("Despicable Me 2", R.drawable.despicable_me_2, "/m/despicable_me_2"),
            new Movie("Ernest & Celestine", R.drawable.ernest_and_celestine, "/m/ernest_and_celestine"),
            new Movie("The Wind Rises", R.drawable.the_wind_rises, "/m/the_wind_rises")
    };
    public static final Movie[] movies2014 = {
            new Movie("Big Hero 6", R.drawable.big_hero_6, "/m/big_hero_6"),
            new Movie("The Boxtrolls", R.drawable.the_boxtrolls, "/m/the_boxtrolls"),
            new Movie("How to Train Your Dragon 2", R.drawable.httyd_2, "/m/how_to_train_your_dragon_2"),
            new Movie("Song of the Sea", R.drawable.song_of_the_sea, "/m/song_of_the_sea_2014"),
            new Movie("The Tale of the Princess Kaguya", R.drawable.kaguyahime_no_monogatari, "/m/the_tale_of_the_princess_kaguya")
    };
    public static final Movie[] movies2015 = {
            new Movie("Inside Out", R.drawable.inside_out, "/m/inside_out_2015"),
            new Movie("Anomalisa", R.drawable.anomalisa, "/m/anomalisa"),
            new Movie("Boy and the World", R.drawable.boy_and_the_world, "/m/boy_and_the_world"),
            new Movie("Shaun the Sheep Movie", R.drawable.shaun_the_sheep, "/m/shaun_the_sheep_movie"),
            new Movie("When Marnie Was There", R.drawable.when_marnie_was_there, "/m/when_marnie_was_there")
    };
    public static final Movie[] movies2016 = {
            new Movie("Zootopia", R.drawable.zootopia, "/m/zootopia"),
            new Movie("Kubo and the Two Strings", R.drawable.kubo_and_the_two_strings, "/m/kubo_and_the_two_strings"),
            new Movie("Moana", R.drawable.moana, "/m/moana_2016"),
            new Movie("My Life as a Zucchini", R.drawable.my_life_as_a_zucchini, "/m/my_life_as_a_zucchini"),
            new Movie("The Red Turtle", R.drawable.the_red_turtle, "/m/the_red_turtle")
    };
    public static final Movie[] movies2017 = {
            new Movie("Coco", R.drawable.coco, "/m/coco_2017"),
            new Movie("The Boss Baby", R.drawable.boss_baby, "/m/the_boss_baby"),
            new Movie("The Breadwinner", R.drawable.the_breadwinner, "/m/the_breadwinner"),
            new Movie("Ferdinand", R.drawable.ferdinand, "/m/ferdinand"),
            new Movie("Loving Vincent", R.drawable.loving_vincent, "/m/loving_vincent")
    };

    public String getName() {
        return name;
    }
//    public String getImageUrl() {
//        return imageUrl;
//    }
    public int getImageResourceID() {
        return imageResourceID;
    }
    public String getRTExtension() {
        return RTExtension;
    }
    public String toString() {
        return this.name;
    }
}
