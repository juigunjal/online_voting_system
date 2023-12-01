/**
 * DatabaseManager
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseManager {
    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineVotingDB", "root", "bharat");
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }catch (SQLException e){ 
            e.printStackTrace();
            return null;
        }
    }
}

// Create database onlineVotingDB;
// use onlineVotingDB;
// create table admin(adminId int auto_increment not null , adminName varchar(30) not null, adminPass Varchar(30) not null , primary key (adminId));
// insert into admin(adminName,adminPass) values ("bharat","password");
