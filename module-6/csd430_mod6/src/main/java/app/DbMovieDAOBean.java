/*
 * Name: Julio Pochet Edmead
 * Date: 09/28/2025
 * Assignment: CSD430 – Modules 6–9 (Project Parts 1–4)
 * Purpose: JDBC helper bean to create/seed/drop the table and perform CRUD (READ/CREATE/UPDATE/DELETE).
 */

package app;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbMovieDAOBean {

    // Connection info for local MySQL per assignment
    private final String url  = "jdbc:mysql://localhost:3306/CSD430?useSSL=false&allowPublicKeyRetrieval=true";
    private final String user = "student1";
    private final String pass = "pass";

    private void loadDriver() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
    }

    // =========================
    // Admin (DDL)
    // =========================
    public void createTable() throws Exception {
        loadDriver();
        String ddl =
            "CREATE TABLE IF NOT EXISTS julio_movies_data (" +
            " movie_id INT AUTO_INCREMENT PRIMARY KEY," +
            " title VARCHAR(120) NOT NULL," +
            " genre VARCHAR(60) NOT NULL," +
            " release_year INT NOT NULL," +
            " rating DECIMAL(3,1) NOT NULL," +
            " director VARCHAR(120) NOT NULL" +
            ")";
        try (Connection c = DriverManager.getConnection(url, user, pass);
             Statement st = c.createStatement()) {
            st.executeUpdate(ddl);
        }
    }

    public void deleteTable() throws Exception {
        loadDriver();
        try (Connection c = DriverManager.getConnection(url, user, pass);
             Statement st = c.createStatement()) {
            st.executeUpdate("DROP TABLE IF EXISTS julio_movies_data");
        }
    }

    public void seedIfEmpty() throws Exception {
        loadDriver();
        try (Connection c = DriverManager.getConnection(url, user, pass);
             Statement st = c.createStatement()) {

            try (ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM julio_movies_data")) {
                rs.next();
                if (rs.getInt(1) > 0) return; // already seeded
            }

            String ins =
                "INSERT INTO julio_movies_data (title, genre, release_year, rating, director) VALUES " +
                "('Inception','Sci-Fi',2010,8.8,'Christopher Nolan')," +
                "('The Dark Knight','Action',2008,9.0,'Christopher Nolan')," +
                "('Interstellar','Sci-Fi',2014,8.6,'Christopher Nolan')," +
                "('The Matrix','Sci-Fi',1999,8.7,'Lana and Lilly Wachowski')," +
                "('Gladiator','Drama',2000,8.5,'Ridley Scott')," +
                "('The Social Network','Drama',2010,7.8,'David Fincher')," +
                "('Parasite','Thriller',2019,8.5,'Bong Joon-ho')," +
                "('Whiplash','Drama',2014,8.5,'Damien Chazelle')," +
                "('Coco','Animation',2017,8.4,'Lee Unkrich')," +
                "('Dune','Sci-Fi',2021,8.0,'Denis Villeneuve')";
            st.executeUpdate(ins);
        }
    }

    // =========================
    // READ helpers
    // =========================
    public List<Integer> getAllIds() throws Exception {
        loadDriver();
        List<Integer> ids = new ArrayList<>();
        String sql = "SELECT movie_id FROM julio_movies_data ORDER BY movie_id";
        try (Connection c = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) ids.add(rs.getInt(1));
        }
        return ids;
    }

    public MovieBean getById(int id) throws Exception {
        loadDriver();
        String sql =
            "SELECT movie_id, title, genre, release_year, rating, director " +
            "FROM julio_movies_data WHERE movie_id = ?";
        try (Connection c = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (!rs.next()) return null;
                MovieBean m = new MovieBean();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setTitle(rs.getString("title"));
                m.setGenre(rs.getString("genre"));
                m.setRelease_year(rs.getInt("release_year"));
                m.setRating(rs.getDouble("rating"));
                m.setDirector(rs.getString("director"));
                return m;
            }
        }
    }

    public List<MovieBean> getAllMovies() throws Exception {
        loadDriver();
        String sql = "SELECT movie_id, title, genre, release_year, rating, director " +
                     "FROM julio_movies_data ORDER BY movie_id";
        List<MovieBean> list = new ArrayList<>();
        try (Connection c = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                MovieBean m = new MovieBean();
                m.setMovie_id(rs.getInt("movie_id"));
                m.setTitle(rs.getString("title"));
                m.setGenre(rs.getString("genre"));
                m.setRelease_year(rs.getInt("release_year"));
                m.setRating(rs.getDouble("rating"));
                m.setDirector(rs.getString("director"));
                list.add(m);
            }
        }
        return list;
    }

    // =========================
    // CREATE
    // =========================
    public int insertMovie(MovieBean m) throws Exception {
        loadDriver();
        String sql = "INSERT INTO julio_movies_data (title, genre, release_year, rating, director) " +
                     "VALUES (?, ?, ?, ?, ?)";
        try (Connection c = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getGenre());
            ps.setInt(3, m.getRelease_year());
            ps.setDouble(4, m.getRating());
            ps.setString(5, m.getDirector());
            ps.executeUpdate();
            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
            }
            return -1; // no key returned
        }
    }

    // =========================
    // UPDATE
    // =========================
    public int updateMovie(MovieBean m) throws Exception {
        loadDriver();
        String sql = "UPDATE julio_movies_data " +
                     "SET title=?, genre=?, release_year=?, rating=?, director=? " +
                     "WHERE movie_id=?";
        try (Connection c = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, m.getTitle());
            ps.setString(2, m.getGenre());
            ps.setInt(3, m.getRelease_year());
            ps.setDouble(4, m.getRating());
            ps.setString(5, m.getDirector());
            ps.setInt(6, m.getMovie_id());
            return ps.executeUpdate(); // 1 if updated, 0 if not found
        }
    }

    // =========================
    // DELETE
    // =========================
    /**
     * Remove a single row by primary key from julio_movies_data.
     * @return number of rows deleted (1 if success, 0 if not found)
     */
    public int deleteMovieById(int id) throws Exception {
        loadDriver();
        String sql = "DELETE FROM julio_movies_data WHERE movie_id = ?";
        try (Connection c = DriverManager.getConnection(url, user, pass);
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate();
        }
    }
}