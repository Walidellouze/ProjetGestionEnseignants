package tn.iit.glid2.model;

public class Enseignant {

	private int id;
	public int getId() {
		return id;
	}
	public void setId(int enseignant) {
		this.id = enseignant;
	}
	public Enseignant(int id, String nom, String prenom, String telephone, String email) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.email = email;
	}
	private String nom="";
	private String prenom="";
	private String telephone="";
	private String email="";
	@Override
	public String toString() {
		return "Enseignant [nom=" + nom + ", prenom=" + prenom + ", telephone=" + telephone + ", email=" + email
				+ ", getNom()=" + getNom() + ", getPrenom()=" + getPrenom() + ", getTelephone()=" + getTelephone()
				+ ", getEmail()=" + getEmail() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public Enseignant(String nom, String prenom, String telephone, String email) {
		super();
		this.nom = nom;
		this.prenom = prenom;
		this.telephone = telephone;
		this.email = email;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
