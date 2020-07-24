@IsTest
public class FixtureLoaderTest {

    private class AccountTemplateLoader extends TemplateLoader {
        public override void load() {
            Fixture.of(Account.class).addTemplate('valid')
                .withPrototype(new Account(
                    BillingCountry = 'Brazil',
                    BillingState = 'Sao Paulo',
                    BillingCity = 'Sao Paulo',
                    BillingStreet = 'Paulista Ave.'
                ));
        }
    }

    @IsTest
    private static void shouldLoadTemplates() {
        // when - loading templates
        FixtureLoader.loadTemplates(new Set<Type> {
            AccountTemplateLoader.class
        });

        // then - template was loaded and can create objects
        Account account = (Account) Fixture.pick(Account.class).create('valid');
    }
}
