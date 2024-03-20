package kw;

public class Book extends Medium {
    private int pages;

    public Book(String name, String publisher, int pages, String copyRightHolder) {
        super(name, publisher, copyRightHolder);
        this.pages = pages;
    }

    @Override
    public String toJsonString() {
        String mediumJson = super.toJsonString();
        return mediumJson.substring(0, mediumJson.length() - 1) + ",\"pages\":" + pages + "}";
    }
}
