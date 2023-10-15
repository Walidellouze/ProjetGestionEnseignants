package tn.iit.glid2.DAO;

import java.util.List;
 
import tn.iit.glid2.model.Autorisation;

public interface IAutorisationDAO {

	void Save(Autorisation autorisation );
	void Delete(Autorisation autorisation );
	void Update(Autorisation autorisation );
    List<Autorisation> getAll();
    List<Autorisation> getAllByEnseignant(int id_enseignant);
	
}
