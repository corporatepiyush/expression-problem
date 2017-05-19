public class Main {


    static void print(Object obj) {
        System.out.println(obj);
    }

    public static void main(String[] args) {

        Expression add = new Add(new Constant(2), new Negate(new Constant(4)));
        print(add.evaluate());


    }
}
