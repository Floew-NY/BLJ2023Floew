package kw;

public class Movie extends Medium{
    private String durration;
    private String mainActor;

    public Movie(String name, String publisher, String durration, String mainActor, String copyRightHolder) {
        super(name, publisher, copyRightHolder);
        this.durration = durration;
        this.mainActor = mainActor;
    }

    @Override
    public String toJsonString() {
        String mediumJson = super.toJsonString();
        return mediumJson.substring(0, mediumJson.length() - 1) + ",\"durration\":\"" + durration + "\",\"mainactor\":\"" + mainActor + "\"}";
    }
}
