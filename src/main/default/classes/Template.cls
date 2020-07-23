public class Template {
    private Map<String, Generator> properties = new Map<String, Generator>();

    public Template withPrototype(SObject prototype) {
        return withPrototype(prototype.getPopulatedFieldsAsMap());
    }

    public Template withPrototype(Map<String, Object> prototype) {
        for (String property : prototype.keySet()) {
            put(property, prototype.get(property));
        }
        return this;
    }

    public Template withGenerators(Map<String, Generator> generators) {
        for (String property : generators.keySet()) {
            put(property, generators.get(property));
        }
        return this;
    }

    public Template withGenerators(Map<Schema.SObjectField, Generator> generators) {
        for (Schema.SObjectField property : generators.keySet()) {
            put(property.getDescribe().getName(), generators.get(property));
        }
        return this;
    }

    public Template put(String property, Generator valueGenerator) {
        properties.put(property, valueGenerator);
        return this;
    }

    public Template put(String property, Object value) {
        return put(property, new IdentityGenerator(value));
    }

    public Object get(String property) {
        if (!properties.containsKey(property)) throw new NoSuchElementException('Property was not set: ' + property);
        return properties.get(property).generate();
    }

    public Set<String> getKeys() {
        return properties.keySet();
    }
}
