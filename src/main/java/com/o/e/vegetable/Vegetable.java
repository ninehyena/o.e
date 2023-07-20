package com.o.e.vegetable;

public class Vegetable {
	private int v_num;
	private String v_name;
	private int v_gram;
	private float v_kcal;
	private float v_carbohydrate;
	private float v_natrium;
	private float v_sugar;
	
	public Vegetable() {
		// TODO Auto-generated constructor stub
	}
	
	public Vegetable(int v_num, String v_name, int v_gram, float v_kcal, float v_carbohydrate, float v_natrium,
			float v_sugar) {
		super();
		this.v_num = v_num;
		this.v_name = v_name;
		this.v_gram = v_gram;
		this.v_kcal = v_kcal;
		this.v_carbohydrate = v_carbohydrate;
		this.v_natrium = v_natrium;
		this.v_sugar = v_sugar;
	}

	public int getV_num() {
		return v_num;
	}

	public void setV_num(int v_num) {
		this.v_num = v_num;
	}

	public String getV_name() {
		return v_name;
	}

	public void setV_name(String v_name) {
		this.v_name = v_name;
	}

	public int getV_gram() {
		return v_gram;
	}

	public void setV_gram(int v_gram) {
		this.v_gram = v_gram;
	}

	public float getV_kcal() {
		return v_kcal;
	}

	public void setV_kcal(float v_kcal) {
		this.v_kcal = v_kcal;
	}

	public float getV_carbohydrate() {
		return v_carbohydrate;
	}

	public void setV_carbohydrate(float v_carbohydrate) {
		this.v_carbohydrate = v_carbohydrate;
	}

	public float getV_natrium() {
		return v_natrium;
	}

	public void setV_natrium(float v_natrium) {
		this.v_natrium = v_natrium;
	}

	public float getV_sugar() {
		return v_sugar;
	}

	public void setV_sugar(float v_sugar) {
		this.v_sugar = v_sugar;
	}
	
}
