public class FixtureLoader {
    
    private FixtureLoader() { }

    public static void loadTemplates(Set<Type> templateLoaderClasses) {
        for (Type templateLoaderClass : templateLoaderClasses) {
            TemplateLoader templateLoader = (TemplateLoader) templateLoaderClass.newInstance();
            templateLoader.load();
        }
    }

}
