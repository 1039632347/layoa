package com.situ.layoa.commons;

import java.io.Serializable;

public class LayResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer Code;
	private  String msg;	
	private Integer count;
	private Object data;
	
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getCode() {
		return Code;
	}
	public void setCode(Integer code) {
		Code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

	
	public LayResult() {
		
	}
	public LayResult(Integer code, String msg, Integer count, Object data) {
		super();
		Code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}
	@Override
	public String toString() {
		return "LayResult [Code=" + Code + ", msg=" + msg + ", count=" + count + ", data=" + data + "]";
	}
	

	
}
