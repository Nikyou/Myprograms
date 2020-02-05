import java.util.Scanner;

public class Calculator {

    public static void main(String args[]) {

        Scanner scanner = new Scanner(System.in);
        String s;
        boolean wrongchar = true;
        again:
        while (wrongchar) {

            System.out.println("'+' - сложение; '-' - вычитаие; '*' - умножение; '/' - деление");
            s = scanner.next();
            char calcmode = s.charAt(0);

            switch (calcmode) {
                case '+':
                    break;
                case '-':
                    break;
                case '*':
                    break;
                case '/':
                    break;
                default:
                    continue again;
            }

            System.out.println("Введите первое число");
            s = scanner.next();
            int a = Integer.parseInt(s);

            System.out.println("Введите второе число");
            s = scanner.next();
            int b = Integer.parseInt(s);

            switch (calcmode) {
                case '+':
                    System.out.println(a + b);
                    break;
                case '-':
                    System.out.println(a - b);
                    break;
                case '*':
                    System.out.println(a * b);
                    break;
                case '/':
                    System.out.println(a / b);
                    break;
            }
            System.out.println("Повторить? '1' - Да; '0' - Нет");
            s = scanner.next();
            calcmode = s.charAt(0);
            if (calcmode == '0') {
                wrongchar = false;
            }

        }
    }
}
