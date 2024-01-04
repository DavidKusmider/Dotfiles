public class UserData {
    private static final long serialVersionUID = 1L;
    private String lastName;   
	private String firstName;
	private String sex;
	private String[] transports;
	private String codePostal;

    public UserData(String ln, String fn, String s,String[] t, String cp) {
		this.lastName = ln;
		this.firstName = fn;
		this.sex = s;
		this.transports = t;
		this.codePostal = cp;
    }

	public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    
    public void setTransports(String[] transport) {
         this.transports = transport;
     }

    public void setCodePostal(String codePostal) {
        this.codePostal = codePostal;
    }

    // Getters
    public String getLastName() {
        return lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getSex() {
        return sex;
    }

     public String[] getTransports() {
         return transports;
     }

    public String getCodePostal() {
        return codePostal;
    }

}

