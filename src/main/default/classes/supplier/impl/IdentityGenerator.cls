public class IdentityGenerator implements Generator {

    private Object value;

    public IdentityGenerator(Object value) {
        this.value = value;
    }

    public Object generate() {
        return value;
    }
}
