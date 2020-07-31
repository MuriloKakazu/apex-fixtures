public abstract class TemplateLoader {
    
    public abstract void load();

    @TestVisible
    protected IdentityGenerator identity(Object value) {
        return new IdentityGenerator(value);
    }

    @TestVisible
    protected AnyGenerator any(Object obj0, Object obj1) {
        return any(new List<Object> { obj0, obj1 });
    }

    @TestVisible
    protected AnyGenerator any(Object obj0, Object obj1, Object obj2) {
        return any(new List<Object> { obj0, obj1, obj2 });
    }

    @TestVisible
    protected AnyGenerator any(List<Object> objects) {
        return new AnyGenerator(objects);
    }

    @TestVisible
    protected RandomGenerator random(Integer minValue, Integer maxValue) {
        return new RandomGenerator(Integer.class, minValue, maxValue);
    }

    @TestVisible
    protected RandomGenerator random(Double minValue, Double maxValue) {
        return new RandomGenerator(Double.class, minValue, maxValue);
    }

    @TestVisible
    protected RandomGenerator random(Decimal minValue, Decimal maxValue) {
        return new RandomGenerator(Decimal.class, minValue, maxValue);
    }

    @TestVisible
    protected RandomGenerator random(Long minValue, Long maxValue) {
        return new RandomGenerator(Long.class, minValue, maxValue);
    }

    @TestVisible
    protected RandomGenerator random(Date minValue, Date maxValue) {
        return new RandomGenerator(Date.class, minValue, maxValue);
    }

    @TestVisible
    protected RandomGenerator random(DateTime minValue, DateTime maxValue) {
        return new RandomGenerator(DateTime.class, minValue, maxValue);
    }

    @TestVisible
    protected CpfGenerator cpf() {
        return new CpfGenerator();
    }

    @TestVisible
    protected TemplateGeneratorsWrapper generator(Schema.SObjectField field, Generator generator) {
        return generator(field.getDescribe().getName(), generator);
    }

    @TestVisible
    protected TemplateGeneratorsWrapper generator(String field, Generator generator) {
        return new TemplateGeneratorsWrapper().generator(field, generator);
    }
}
