package com.noo.wms.vo;

public class TestVo {
	private int seq;
	private String mb_id;
	private String mb_pw;
	private String address;
	private String mb_tell;
	
	public TestVo() {
		super();
	}

	public TestVo(int seq, String mb_id, String mb_pw, String address, String mb_tell) {
		super();
		this.seq = seq;
		this.mb_id = mb_id;
		this.mb_pw = mb_pw;
		this.address = address;
		this.mb_tell = mb_tell;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getMb_pw() {
		return mb_pw;
	}

	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMb_tell() {
		return mb_tell;
	}

	public void setMb_tell(String mb_tell) {
		this.mb_tell = mb_tell;
	}
	
}
