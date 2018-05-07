package com.example.ryantabler.final2;

/**
 * Created by ryantabler on 5/6/18.
 */

public class WorkoutType {

    private String name;

    public WorkoutType(String name) {
        this.name = name;
    }

    public static WorkoutType[] allWorkoutTypes = {
            new WorkoutType("Cardio"),
            new WorkoutType("Strength"),
            new WorkoutType("Flexibility"),
    };

    @Override
    public String toString() {
        return name;
    }
}
