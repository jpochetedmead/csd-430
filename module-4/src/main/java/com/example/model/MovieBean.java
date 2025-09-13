/*
 * Author: Julio Pochet
 * Date: 08/31/2025
 * Course: CSD-430
 * Assignment: Module 4 – JavaBean
 * Purpose: Hold movie data (Title, Director, Year) from Module 2 plus Category and Notes.
 */

package com.example.model;

import java.io.Serializable;

public class MovieBean implements Serializable {

    private static final long serialVersionUID = 1L;

    // ---- Fields (5 total) ----
    private String title;
    private String director;
    private int year;
    private String category;
    private String notes;

    // ---- No-arg constructor (required for JavaBeans) ----
    public MovieBean() {}

    // ---- Getters & Setters ----
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getNotes() { return notes; }
    public void setNotes(String notes) { this.notes = notes; }
}