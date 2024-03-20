package kw;

public class Videogame extends Medium{
    private String developer;
    private String platform;

    public Videogame(String name, String publisher, String developer, String platform, String copyrightHolder) {
        super(name, publisher, copyrightHolder);
        this.developer = developer;
        this.platform = platform;
    }

    @Override
    public String toJsonString() {
        String mediumJson = super.toJsonString();
        return mediumJson.substring(0, mediumJson.length() - 1) + ",\"developer\":\"" + developer + "\",\"platform\":\"" + platform + "\"}";
    }
}
