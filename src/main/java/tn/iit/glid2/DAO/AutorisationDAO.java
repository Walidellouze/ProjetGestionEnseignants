package tn.iit.glid2.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import tn.iit.glid2.model.Autorisation;
import tn.iit.glid2.model.Enseignant;
import tn.iit.glid2.util.JDBCUtil;

public class AutorisationDAO implements IAutorisationDAO {

    @Override
    public void Save(Autorisation autorisation) {
        String query = "INSERT INTO autorisation VALUES (0, " + autorisation.getId_enseignant() + ", '"
                + autorisation.getDate() + "', " + autorisation.getNb_heure() + ", '" + autorisation.getDescription()
                + "')";

        try {

            JDBCUtil.getStatement().executeUpdate(query);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void Delete(Autorisation autorisation) {
        String query = "DELETE FROM autorisation WHERE id =" + autorisation.getId();
        try {
            JDBCUtil.getStatement().executeUpdate(query);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void Update(Autorisation autorisation) {
        String query = "UPDATE autorisation SET id_enseignant = " + autorisation.getId_enseignant() + ", date = '"
                + autorisation.getDate() + "', nb_heure = " + autorisation.getNb_heure() + ", description = '"
                + autorisation.getDescription() + "' WHERE id =" + autorisation.getId();

        try {

            JDBCUtil.getStatement().executeUpdate(query);

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<Autorisation> getAll() {
        String query = "SELECT * FROM autorisation";
        List<Autorisation> ListRes = new ArrayList<>();

        try {
            ResultSet rs = JDBCUtil.getStatement().executeQuery(query);
            while (rs.next()) {
                LocalDate dateAutorisation = LocalDate.parse(rs.getString(3),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                ListRes.add(new Autorisation(rs.getInt(1), rs.getInt(2), dateAutorisation, rs.getInt(4),
                        rs.getString(5)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ListRes;
    }

    @Override
    public List<Autorisation> getAllByEnseignant(int id_enseignant) {
        String query = "SELECT * FROM autorisation INNER JOIN enseignant ON enseignant.id=autorisation.id_enseignant WHERE enseignant.id="
                + id_enseignant;
        List<Autorisation> ListRes = new ArrayList<>();

        try {
            ResultSet rs = JDBCUtil.getStatement().executeQuery(query);
            while (rs.next()) {
                LocalDate dateAutorisation = LocalDate.parse(rs.getString(3),
                        DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                ListRes.add(new Autorisation(rs.getInt(1), rs.getInt(2), dateAutorisation, rs.getInt(4),
                        rs.getString(5)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ListRes;
    }

    public int getNbHeure(int id_enseignant, int weekDate) {
        String query = "SELECT SUM(nb_heure) FROM autorisation WHERE id_enseignant=" + id_enseignant + " AND WEEK(date)="
                + weekDate;
        int res = 0;

        try {
            ResultSet rs = JDBCUtil.getStatement().executeQuery(query);
            while (rs.next()) {
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    public int getNbHeureRestante(int id_enseignant, int year) {
        String query = "SELECT SUM(nb_heure) FROM autorisation WHERE id_enseignant=" + id_enseignant + " AND YEAR(date)="
                + year;
        int res = 0;

        try {
            ResultSet rs = JDBCUtil.getStatement().executeQuery(query);
            while (rs.next()) {
                res = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

}
