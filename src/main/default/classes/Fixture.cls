public class Fixture {

    private Map<Type, TemplateHolder> templates = new Map<Type, TemplateHolder>();
    
    public static TemplateHolder of(Type type) {
        if (!templates.containsKey(type)) {
            templates.put(type, new TemplateHolder(type));
        }

        return templates.get(type);
    }

    public static SObjectFactory pick(Type type) {
        return new SObjectFactory(of(type));
    }

}
