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

    public Template addTemplate(String name) {
        Template template = new Template();
        templates.put(name, template);
        return template;
    }
}
