public class IdentitySupplier implements Supplier {

    private Object value;

    public IdentitySupplier(Object value) {
        this.value = value;
    }

    public Object get() {
        return value;
    }
}
