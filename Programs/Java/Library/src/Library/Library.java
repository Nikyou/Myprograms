package Library;

public class Library {
    private Book[] List;
    public void Add(Book b){
       List[List.length+1]=b;
    }
    public void Delete(Book b){
        for (int i=0; i<List.length;i++){
            if (List[i]==b) {
                for (int j=i+1;i<List.length;j++){
                    List[j-1]=List[j];
                }
                Book[] BList;
                BList= new Book[];
                for (int j=0; j<List.length-1;j++){
                    BList[j]=List[j];
                }
                List=BList;
                BList=null;
                break;
            }
        }
    }
    public void Sort(){
        again:
        for (int i=1; i<List.length;i++){
            if (List[i-1].
        }
    }


}
