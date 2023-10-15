package tn.iit.glid2.DAO;

import java.util.List;

import tn.iit.glid2.model.Utilisateur;

public interface IUserDao {
    void Save(Utilisateur user);
    void Delete(Utilisateur user);
    void Update(Utilisateur user);
    List<Utilisateur> getAll();
    Utilisateur findByLoginPwd(String login, String pwd);
}
