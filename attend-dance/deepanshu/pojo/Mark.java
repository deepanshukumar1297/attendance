package pojo;

import java.sql.Date;

public class Mark
{
	private String[] student_id;
	private String[] section_id;
	private String[] subject_id;
	private String[] teacher_id;
	private String[] attendance;
	private Date[] date_of_attendance;
	public String[] getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String[] student_id) {
		this.student_id = student_id;
	}
	public String[] getSection_id() {
		return section_id;
	}
	public void setSection_id(String[] section_id) {
		this.section_id = section_id;
	}
	public String[] getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String[] subject_id) {
		this.subject_id = subject_id;
	}
	public String[] getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String[] teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String[] getAttendance() {
		return attendance;
	}
	public void setAttendance(String[] attendance) {
		this.attendance = attendance;
	}
	public Date[] getDate_of_attendance() {
		return date_of_attendance;
	}
	public void setDate_of_attendance(Date[] date_of_attendance) {
		this.date_of_attendance = date_of_attendance;
	}
	

}
