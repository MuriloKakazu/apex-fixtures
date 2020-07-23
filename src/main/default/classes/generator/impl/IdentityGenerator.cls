public class IdentityGenerator extends AbstractGenerator {

    private Object value;

    public IdentityGenerator(Object value) {
        this.value = value;
    }

    public override Object generate() {
        return value;
    }
}
