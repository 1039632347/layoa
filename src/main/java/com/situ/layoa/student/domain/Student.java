package com.situ.layoa.student.domain;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;



@Alias("Student")
public class Student implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Long rowId;
	private String stuName;
	private String stuAge;
	private Integer stuSex;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String stuBirthday;
	private List<String> stuLikes;
	public Long getRowId() {
		return rowId;
	}
	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getStuAge() {
		return stuAge;
	}
	public void setStuAge(String stuAge) {
		this.stuAge = stuAge;
	}
	public Integer getStuSex() {
		return stuSex;
	}
	public void setStuSex(Integer stuSex) {
		this.stuSex = stuSex;
	}
	public String getStuBirthday() {
		return stuBirthday;
	}
	public void setStuBirthday(String stuBirthday) {
		this.stuBirthday = stuBirthday;
	}
	public List<String> getStuLikes() {
		return stuLikes;
	}
	public void setStuLikes(List<String> stuLikes) {
		this.stuLikes = stuLikes;
	}
	@Override
	public String toString() {
		return "Student [rowId=" + rowId + ", stuName=" + stuName + ", stuAge=" + stuAge + ", stuSex=" + stuSex
				+ ", stuBirthday=" + stuBirthday + ", stuLikes=" + stuLikes + "]";
	}


	
	
}
