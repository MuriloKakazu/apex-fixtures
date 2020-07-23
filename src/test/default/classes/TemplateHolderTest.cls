@IsTest
public class TemplateHolderTest {
    
    @IsTest
    private static void shouldAddTemplate() {
        // given - a template holder
        TemplateHolder templates = new TemplateHolder(Account.class);

        // when - adding template
        templates.addTemplate('example');

        // then - template can be retrieved
        System.assertNotEquals(null, templates.getTemplate('example'));
    }

    @IsTest
    private static void shouldThrowExceptionWhenRetrievingNotLoadedTemplate() {
        // given - a template holder
        TemplateHolder templates = new TemplateHolder(Account.class);

        // when - trying to get template that was not loaded
        try {
            templates.getTemplate('Unknown');

            System.assert(false, 'Should have thrown exception');
        } catch (NoSuchElementException e) {
            // then - correct exception is thrown
            System.assert(e.getMessage().contains('Template was not loaded'));
        }
    }

    @IsTest
    private static void shouldThrowExceptionWhenAddingTemplateTwice() {
        // given - a template holder
        TemplateHolder templates = new TemplateHolder(Account.class);

        // and - with a single "example" template
        templates.addTemplate('example');

        // when - trying to add another template with the same name
        try {
            templates.addTemplate('example');

            System.assert(false, 'Should have thrown exception');
        } catch (ConstraintException e) {
            // then - correct exception is thrown
            System.assert(e.getMessage().contains('Template was already loaded'));
        }
    }

}
