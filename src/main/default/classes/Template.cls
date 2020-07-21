public class Template {
    private Map<String, Supplier> properties = new Map<String, Supplier>();

    public Template() { }

    public Template(Map<String, Object> values) {
        for (String key : values.keySet()) {
            put(key, values.get(key));
        }
    }

    public Template put(String key, Object value) {
        return put(key, new IdentitySupplier(value));
    }

    public Template put(String key, Supplier valueSupplier) {
        properties.put(key, valueSupplier);
        return this;
    }

    public Object get(String key) {
        return properties.get(key).get();
    }

    public Set<String> getKeys() {
        return properties.keySet();
    }
}
