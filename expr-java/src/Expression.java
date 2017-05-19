
// Addition of new TYPE is possible without touching existing code


public abstract class Expression {
    public abstract String print();
    public abstract Integer evaluate();
}

class Constant extends Expression {

    private final Integer info;

    public Constant(Integer info) {
        this.info = info;
    }

    @Override
    public String print() {
        return info.toString();
    }

    @Override
    public Integer evaluate() {
        return info;
    }
}


class Add extends Expression {

    private final Expression left;
    private final Expression right;

    public Add(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public String print() {
        return left.print() + " + " + right.print();
    }

    @Override
    public Integer evaluate() {
        return left.evaluate() + right.evaluate();
    }
}


class Negate extends Expression {

    private final Constant num;

    public Negate(Constant num) {
        this.num = num;
    }

    @Override
    public String print() {
        return null;
    }

    @Override
    public Integer evaluate() {
        return - num.evaluate();
    }
}