package pojo;

public class Section
{
	private String name;
	private String id;
	
	@Override
	public String toString() {
		return "" + name + "  " + id + "";
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
