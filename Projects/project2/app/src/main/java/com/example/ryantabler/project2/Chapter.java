package com.example.ryantabler.project2;

/**
 * Created by ryantabler on 4/24/18.
 */

public class Chapter {
    private int chapterNum;

    public Chapter(int chapterNum) {
        this.chapterNum = chapterNum;
    }

    public static final Chapter[] allChaptersStatic = {
            new Chapter(1),
            new Chapter(2),
            new Chapter(3),
            new Chapter(4),
            new Chapter(5),
            new Chapter(6),
            new Chapter(7),
            new Chapter(8),
            new Chapter(9),
            new Chapter(10),
            new Chapter(11),
            new Chapter(12),
            new Chapter(13),
            new Chapter(14),
            new Chapter(15),
            new Chapter(16),
            new Chapter(17),
            new Chapter(18),
            new Chapter(19),
            new Chapter(20),
            new Chapter(21),
            new Chapter(22),
            new Chapter(23),
            new Chapter(24),
            new Chapter(25),
            new Chapter(26),
            new Chapter(27),
            new Chapter(28),
            new Chapter(29),
            new Chapter(30),
            new Chapter(31),
            new Chapter(32),
            new Chapter(33),
            new Chapter(34),
            new Chapter(35),
            new Chapter(36),
            new Chapter(37),
            new Chapter(38),
            new Chapter(39),
            new Chapter(40),
            new Chapter(41),
            new Chapter(42),
            new Chapter(43),
            new Chapter(44),
            new Chapter(45),
            new Chapter(46),
            new Chapter(47),
            new Chapter(48),
            new Chapter(49),
            new Chapter(50),
            new Chapter(51),
            new Chapter(52),
            new Chapter(53),
            new Chapter(54),
            new Chapter(55),
            new Chapter(56),
            new Chapter(57),
            new Chapter(58),
            new Chapter(59),
            new Chapter(60),
            new Chapter(61),
            new Chapter(62),
            new Chapter(63),
            new Chapter(64),
            new Chapter(65),
            new Chapter(66),
            new Chapter(67),
            new Chapter(68),
            new Chapter(69),
            new Chapter(70),
            new Chapter(71),
            new Chapter(72),
            new Chapter(73),
            new Chapter(74),
            new Chapter(75),
            new Chapter(76),
            new Chapter(77),
            new Chapter(78),
            new Chapter(79),
            new Chapter(70),
            new Chapter(81),
    };

    public Chapter[] getAllChapters() {
        Chapter[] allChapters = new Chapter[81];
        for (int i=0; i<81; i++) {
            allChapters[i].chapterNum = i+1;
        }
        return allChapters;
    }

    @Override
    public String toString() {
        return Integer.toString(this.chapterNum);
    }
}
