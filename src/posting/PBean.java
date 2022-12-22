package posting;

public class PBean {
	private int QA_number;
	private String QA_title;
	private String mem_id;
	private String QA_date;
	private String QA_content;
	private int QA_available;
	private String mem_email;
	
	
	public int getQA_number() {
		return QA_number;
	}
	public void setQA_number(int qA_number) {
		QA_number = qA_number;
	}
	public String getQA_title() {
		return QA_title;
	}
	public void setQA_title(String qA_title) {
		QA_title = qA_title;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getQA_date() {
		return QA_date;
	}
	public void setQA_date(String qA_date) {
		QA_date = qA_date;
	}
	public String getQA_content() {
		return QA_content;
	}
	public void setQA_content(String qA_content) {
		QA_content = qA_content;
	}
	public int getQA_available() {
		return QA_available;
	}
	public void setQA_available(int qA_available) {
		QA_available = qA_available;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	
	
}