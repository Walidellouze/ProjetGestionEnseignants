package tn.iit.glid2.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import tn.iit.glid2.model.Utilisateur;
import tn.iit.glid2.util.JDBCUtil;
 

public class UserDAO implements IUserDao {

	@Override
	public void Save(Utilisateur user) {
		 String query= "insert into utilisateur values (0,'"+user.getNom()+"' , '"+user.getPrenom()+"' , '"+user.getLogin()+"', '"+user.getPwd()+"'  )";
		
		 try {
			 
			 JDBCUtil.getStatement().executeUpdate(query);
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
	}

	@Override
	public void Delete(Utilisateur user) {
		 String query= "delete from  utilisateur where id ="+user.getId();			
		 try {			 
			 JDBCUtil.getStatement().executeUpdate(query);			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public void Update(Utilisateur user) {
		 String query= "update  from  utilisateur where id ="+user.getId();
			
		 try {
			 
			 JDBCUtil.getStatement().executeUpdate(query);
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
	}

	@Override
	public List<Utilisateur> getAll() { 
		 String query = "select * from  utilisateur ";
		 List<Utilisateur> ListRes =new ArrayList<Utilisateur>();
		 
		 try {			 
			ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
			
		 
			while (rs.next())
			{
			 
				ListRes.add(new Utilisateur(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)) );
			}	
			 
		 }
		 catch(SQLException e )
		 {
			 e.printStackTrace();
		 }
		
			return ListRes;
	}

	@Override
	public Utilisateur findByLoginPwd(String login, String pwd) {
	 String query = "select * from  utilisateur where login= '"+login+"' and pwd = '"+pwd+"'";
	 Utilisateur res = null;
	 
	 try {
		 
		ResultSet rs= JDBCUtil.getStatement().executeQuery(query);
		if (rs.next())
		{
			res=new Utilisateur(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5) );
		}
	
		 
	 }
	 catch(SQLException e )
	 {
		 e.printStackTrace();
	 }
	
		return res;
	 
	}
	
	

}
