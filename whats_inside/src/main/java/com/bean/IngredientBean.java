package com.bean;

public class IngredientBean {

    private Long ingredientId;
    private String name; // INS211
    private String scientificName; // Sodium Benzoate (INS 211)
    private String commonUsage;
    private String avoidBy;
    private String fda;
    private String fssai;
    private String efsa;

    // Getters and Setters
    public Long getIngredientId() {
        return ingredientId;
    }

    public void setIngredientId(Long ingredientId) {
        this.ingredientId = ingredientId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }

    public String getCommonUsage() {
        return commonUsage;
    }

    public void setCommonUsage(String commonUsage) {
        this.commonUsage = commonUsage;
    }

    public String getAvoidBy() {
        return avoidBy;
    }

    public void setAvoidBy(String avoidBy) {
        this.avoidBy = avoidBy;
    }

    public String getFda() {
        return fda;
    }

    public void setFda(String fda) {
        this.fda = fda;
    }

    public String getFssai() {
        return fssai;
    }

    public void setFssai(String fssai) {
        this.fssai = fssai;
    }

    public String getEfsa() {
        return efsa;
    }

    public void setEfsa(String efsa) {
        this.efsa = efsa;
    }
}
