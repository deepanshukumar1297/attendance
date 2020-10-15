package pojo;

public class Student
{
	private String name;
	private String id;
	private String section;

//	@Override
//	public String toString() {
//		return "Teacher [name=" + name + ", id=" + id + "]";
//	}
	
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
