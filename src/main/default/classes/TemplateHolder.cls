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
        if (!templates.containsKey(name)) throw new NoSuchElementException('Template was not loaded: ' + name);
        return templates.get(name);
    }

    public Template addTemplate(String name) {
        if (templates.containsKey(name)) throw new ConstraintException('Template was already loaded: ' + name);
        Template template = new Template();
        templates.put(name, template);
        return template;
    }
}
