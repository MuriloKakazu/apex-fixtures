public class Template {
    private Map<String, Supplier> properties = new Map<String, Supplier>();

    public Template withPrototype(SObject prototype) {
        return withPrototype(prototype.getPopulatedFieldsAsMap());
    }

    public Template withPrototype(Map<String, Object> prototype) {
        for (String property : prototype.keySet()) {
            put(property, prototype.get(property));
        }
        return this;
    }

    public Template withGenerators(Map<String, Supplier> generators) {
        for (String property : generators.keySet()) {
            put(property, generators.get(property));
        }
        return this;
    }

    public Template withGenerators(Map<Schema.SObjectField, Supplier> generators) {
        for (Schema.SObjectField property : generators.keySet()) {
            put(property.getDescribe().getName(), generators.get(property));
        }
        return this;
    }

    public Template put(String property, Supplier valueSupplier) {
        properties.put(property, valueSupplier);
        return this;
    }

    public Template put(String property, Object value) {
        return put(property, new IdentitySupplier(value));
    }

    public Object get(String property) {
        return properties.get(property).get();
    }

    public Set<String> getKeys() {
        return properties.keySet();
    }
}
