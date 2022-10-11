package com.noo.wms.vo;

public class ShotcutVo {

	private int shotcut_num;
	private String shotcut_name;
	private String shotcut_value;
	private int shotcut_category;
	
	public ShotcutVo() {
		super();
	}

	public ShotcutVo(int shotcut_num, String shotcut_name, String shotcut_value, int shotcut_category) {
		super();
		this.shotcut_num = shotcut_num;
		this.shotcut_name = shotcut_name;
		this.shotcut_value = shotcut_value;
		this.shotcut_category = shotcut_category;
	}

	public int getShotcut_num() {
		return shotcut_num;
	}

	public void setShotcut_num(int shotcut_num) {
		this.shotcut_num = shotcut_num;
	}

	public String getShotcut_name() {
		return shotcut_name;
	}

	public void setShotcut_name(String shotcut_name) {
		this.shotcut_name = shotcut_name;
	}

	public String getShotcut_value() {
		return shotcut_value;
	}

	public void setShotcut_value(String shotcut_value) {
		this.shotcut_value = shotcut_value;
	}

	public int getShotcut_category() {
		return shotcut_category;
	}

	public void setShotcut_category(int shotcut_category) {
		this.shotcut_category = shotcut_category;
	}

}
