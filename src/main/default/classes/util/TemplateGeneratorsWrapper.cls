public class TemplateGeneratorsWrapper {
    
    private Map<String, Generator> generators = new Map<String, Generator>();

    public TemplateGeneratorsWrapper generator(Schema.SObjectField field, Generator generator) {
        return generator(field.getDescribe().getName(), generator);
    }

    public TemplateGeneratorsWrapper generator(String field, Generator generator) {
        generators.put(field, generator);
        return this;
    }

    public Map<String, Generator> getGenerators() {
        return generators;
    }

}
