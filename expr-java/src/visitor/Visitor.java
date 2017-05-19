package visitor;

// Addition of new OPERATION is possible without touching existing code

public interface Visitor<T> {

    T visitConstant(Constant c);
    T visitAdd(Add add);

}

interface Expression {

    <T> T accept(Visitor<T> v);

}

class Constant implements Expression {

    public final Integer num;

    public Constant(Integer num) {
        this.num = num;
    }

    @Override
    public <T> T accept(Visitor<T> v) {
        return v.visitConstant(this);
    }
}


class Add implements Expression {

    public final Expression left;
    public final Expression right;

    public Add(Expression left, Expression right) {
        this.left = left;
        this.right = right;
    }

    @Override
    public <T> T accept(Visitor<T> v) {
        return v.visitAdd(this);
    }
}


class PrintVisitor implements Visitor<String> {

    @Override
    public String visitConstant(Constant c) {
        return c.num.toString();
    }

    @Override
    public String visitAdd(Add add) {
        return add.left.accept(this) + " + " + add.right.accept(this);
    }

}

class EvaluateVisitor implements  Visitor<Integer> {

    @Override
    public Integer visitConstant(Constant c) {
        return c.num;
    }

    @Override
    public Integer visitAdd(Add add) {
        return add.left.accept(this) +  add.right.accept(this);
    }
}