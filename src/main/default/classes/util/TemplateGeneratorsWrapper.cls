public class TemplateGeneratorsWrapper {
    
    private Map<Schema.SObjectField, Generator> generators = new Map<Schema.SObjectField, Generator>();

    public TemplateGeneratorsWrapper generator(Schema.SObjectField field, Generator generator) {
        generators.put(field, generator);
        return this;
    }

    public Map<Schema.SObjectField, Generator> getGenerators() {
        return generators;
    }

}
