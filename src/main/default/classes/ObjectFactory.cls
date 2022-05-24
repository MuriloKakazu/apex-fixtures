public class ObjectFactory {

    private TemplateHolder templates;
    
    public ObjectFactory(TemplateHolder templates) {
        this.templates = templates;
    }

    public Object create(String templateName) {
        Template template = templates.getTemplate(templateName);
        Map<String, Object> obj = new Map<String, Object>();
        for (String field : template.getKeys()) {
            if (!obj.containsKey(field)) {
                obj.put(field, template.get(field));
            }
        }
        return JSON.deserialize(JSON.serialize(obj), templates.getType());
    }
    
    public Object create(String templateName, SObject record) {
        Template template = templates.getTemplate(templateName);
        return create(template, record);
    }

    private Object create(Template template, SObject record) {
        for (String field : template.getKeys()) {
            if (!record.isSet(field)) {
                record.put(field, template.get(field));
            }
        }
        return record;
    }

}
