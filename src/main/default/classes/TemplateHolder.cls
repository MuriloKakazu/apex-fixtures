public class TemplateHolder {
    private Type type;
    private Map<String, Template> templates = new Map<String, Template>();

    public TemplateHolder(Type type) {
        this.type = type;
    }

    public Type getType() {
        return type;
    }

    public Template getTemplate(String name) {
        return templates.get(name);
    }

    public TemplateHolder addTemplate(String name, Template template) {
        templates.put(name, template);
        return this;
    }

    public TemplateHolder addTemplate(String name, Map<String, Object> values) {
        return addTemplate(name, new Template(values));
    }
}
