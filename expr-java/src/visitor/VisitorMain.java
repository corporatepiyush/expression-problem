package visitor;

public class VisitorMain {

    static void print(Object obj) {
        System.out.println(obj);
    }

    public static void main(String[] args) {

        Visitor evaluator = new EvaluateVisitor();
        print("Evaluator Visitor Constant = " + evaluator.visitConstant(new Constant(4)));
        print("Evaluator Visitor Add = " + evaluator.visitAdd(new Add(new Constant(4), new Constant(-6))));

        Visitor printer = new PrintVisitor();
        print("Printer Visitor Constant = " + printer.visitConstant(new Constant(4)));
        print("Printer Visitor Add = " + printer.visitAdd(new Add(new Constant(4), new Constant(-6))));


    }
}
