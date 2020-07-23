@IsTest
public class TemplateTest {

    private class ZeroGenerator implements Generator {
        public Object generate() { return 0; }
    }

    private class BananaGenerator implements Generator {
        public Object generate() { return 'Banana'; }
    }

    @IsTest
    private static void shouldAddSObjectFieldValuesToTemplateProperties() {
        // given - an SObject
        Account account = new Account(Name = 'Jhon', Phone = '+5511940404040');

        // when - creating template
        Template template = new Template().withPrototype(account);

        // then - SObject fields and values were added to template properties
        System.assertEquals(account.Name, template.get('Name'));
        System.assertEquals(account.Phone, template.get('Phone'));
    }

    @IsTest
    private static void shouldAddMapKeyAndValuesToTemplateProperties() {
        // given - mapped values
        Map<String, Object> mappedValues = new Map<String, Object> {
            'Name' => 'Jhon',
            'Phone' => '+5511940404040'
        };

        // when - creating template
        Template template = new Template().withPrototype(mappedValues);

        // then - SObject fields and values were added to template properties
        System.assertEquals(mappedValues.get('Name'), template.get('Name'));
        System.assertEquals(mappedValues.get('Phone'), template.get('Phone'));
    }

    @IsTest
    private static void shouldAddGeneratorsBySObjectFieldToTemplateProperties() {
        // given - generators
        Map<Schema.SObjectField, Generator> generators = new Map<Schema.SObjectField, Generator> {
            Account.Name => new BananaGenerator(),
            Account.Phone => new ZeroGenerator()
        };

        // when - creating template
        Template template = new Template().withGenerators(generators);

        // then - generators were added to template properties
        System.assertEquals('Banana', template.get('Name'));
        System.assertEquals(0, template.get('Phone'));
    }

    @IsTest
    private static void shouldAddGeneratorsByStringToTemplateProperties() {
        // given - generators
        Map<String, Generator> generators = new Map<String, Generator> {
            'Name' => new BananaGenerator(),
            'Phone' => new ZeroGenerator()
        };

        // when - creating template
        Template template = new Template().withGenerators(generators);

        // then - generators were added to template properties
        System.assertEquals('Banana', template.get('Name'));
        System.assertEquals(0, template.get('Phone'));
    }

    @IsTest
    private static void shouldThrowExceptionWhenRetrievingInexistentProperty() {
        // given - a template
        Template template = new Template();

        // when - trying to get inexistent property
        try {
            template.get('Unknown');

            System.assert(false, 'Should have thrown exception');
        } catch (NoSuchElementException e) {
            // then - correct exception is thrown
            System.assert(e.getMessage().contains('Property was not set'));
        }
    }

}
