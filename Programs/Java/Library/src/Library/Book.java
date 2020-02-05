package Library;
import java.text.SimpleDateFormat;

public class Book {
    public String Title, Author;
    public int PageCount;
    public SimpleDateFormat PublishDate;
    public String Printbook() {
        String b;
        b = Title+" "+Author+" "+PageCount+" "+PublishDate;
        return b;
    }
    public Book(String[] args) {
        Title=args[0];
        Author=args[1];
        PageCount=Integer.parseInt(args[2]);
        PublishDate= new SimpleDateFormat("dd/mm/yyyy").parse(args[3]);
    }
}
