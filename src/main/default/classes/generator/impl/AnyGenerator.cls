public class AnyGenerator extends AbstractGenerator {
    private List<Object> dataset = new List<Object>();

    public AnyGenerator(List<Object> dataset) {
        this.dataset = dataset;
    }

    public override Object generate() {
        return dataset[MathUtil.randomInteger(0, dataset.size())];
    }
}
