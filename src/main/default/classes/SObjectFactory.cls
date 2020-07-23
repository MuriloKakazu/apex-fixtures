public class SObjectFactory {

    private TemplateHolder templates;
    
    public SObjectFactory(TemplateHolder templates) {
        this.templates = templates;
    }

    public SObject create(String templateName) {
        return create(templateName, (SObject) templates.getType().newInstance());
    }
    
    public SObject create(String templateName, SObject record) {
        Template template = templates.getTemplate(templateName);
        return create(template, record);
    }

    private SObject create(Template template, SObject record) {
        for (String field : template.getKeys()) {
            if (!record.isSet(field)) {
                record.put(field, template.get(field));
            }
        }
        return record;
    }

}
