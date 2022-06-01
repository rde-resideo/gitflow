import java.util.Scanner; 41

class MyFirstClass
{
    public static void main(String[] args) {
        System.out.println("Enter a Number");
        int a;
        Scanner s=new Scanner(System.in);
        a=s.nextInt();
        System.out.println((a+10));
        //s.close();
    }
}
