public class Fixture {

    private static Map<Type, TemplateHolder> templates = new Map<Type, TemplateHolder>();
    
    public static TemplateHolder of(Type type) {
        if (!templates.containsKey(type)) {
            templates.put(type, new TemplateHolder(type));
        }

        return templates.get(type);
    }

    public static ObjectFactory pick(Type type) {
        return new ObjectFactory(of(type));
    }

}
