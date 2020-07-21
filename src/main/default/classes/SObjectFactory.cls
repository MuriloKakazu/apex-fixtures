public class SObjectFactory {

    private TemplateHolder templates;
    
    public SObjectFactory(TemplateHolder templates) {
        this.templates = templates;
    }

    public SObject create(String templateName) {
        return create(templateName, templates.getType().newInstance());
    }
    
    public SObject create(String templateName, SObject prototype) {
        Template template = templates.get(templateName);
        return create(template, prototype);
    }

    private SObject create(Template template, SObject prototype) {
        SObject record = prototype;

        for (String field : template.getNames()) {
            if (!record.isSet(field)) {
                record.put(field, templte.get(field));
            }
        }

        return record;
    }

}
