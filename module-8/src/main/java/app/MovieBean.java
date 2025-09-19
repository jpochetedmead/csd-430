/*
 * Name: Julio Pochet Edmead
 * Date: 09/21/2025
 * Assignment: CSD430 – Modules 6–8 (Project Parts 1–3)
 * Purpose: JavaBean representing a movie row.
 */
package app;

public class MovieBean {
    private int movie_id;
    private String title;
    private String genre;
    private int release_year;
    private double rating;
    private String director;

    public int getMovie_id() { return movie_id; }
    public void setMovie_id(int movie_id) { this.movie_id = movie_id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public int getRelease_year() { return release_year; }
    public void setRelease_year(int release_year) { this.release_year = release_year; }

    public double getRating() { return rating; }
    public void setRating(double rating) { this.rating = rating; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }
}