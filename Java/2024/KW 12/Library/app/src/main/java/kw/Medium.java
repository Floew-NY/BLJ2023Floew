package kw;

public class Medium {
    protected String name;
    protected String publisher;
    protected String copyrightHolder;

    public Medium(String name, String publisher, String copyrightHolder) {
        this.name = name;
        this.publisher = publisher;
        this.copyrightHolder = copyrightHolder;
    }

    public String toJsonString() {
        return "{\"name\":\"" + name + "\",\"publisher\":\"" + publisher + "\",\"copyrightholder\":\"" + copyrightHolder + "\"}";
    }
}
