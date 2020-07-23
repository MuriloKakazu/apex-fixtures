public class AnyGenerator extends AbstractGenerator {
    private List<Object> dataset = new List<Object>();

    public AnyGenerator(Object obj0, Object obj1) {
        this(new List<Object> { obj0, obj1 });
    }

    public AnyGenerator(Object obj0, Object obj1, Object obj2) {
        this(new List<Object> { obj0, obj1, obj2 });
    }

    public AnyGenerator(List<Object> dataset) {
        this.dataset = dataset;
    }

    public override Object generate() {
        return dataset[MathUtil.randomInteger(0, dataset.size())];
    }
}
