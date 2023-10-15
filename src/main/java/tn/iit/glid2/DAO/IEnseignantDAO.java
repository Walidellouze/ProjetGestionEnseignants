package tn.iit.glid2.DAO;

import java.util.List;

import tn.iit.glid2.model.Enseignant;
 

public interface IEnseignantDAO {
	
	void Save(Enseignant enseignant );
	void Delete(int id);
	void Update(String enseignant,String nom, String prenom, String tel, String email );
    List<Enseignant> getAll();
    Enseignant findByID(int id );
	

}