package pojo;

import java.sql.Date;

public class GetMark {
	
	private String student_id;
	private String attendance;
	private Date date_of_attendance;
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	public Date getDate_of_attendance() {
		return date_of_attendance;
	}
	public void setDate_of_attendance(Date date_of_attendance) {
		this.date_of_attendance = date_of_attendance;
	}
}
