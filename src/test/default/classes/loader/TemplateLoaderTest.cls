@IsTest
public class TemplateLoaderTest {

    private class AccountTemplateLoader extends TemplateLoader {
        public override void load() {
            Fixture.of(Account.class).addTemplate('valid')
                .withPrototype(new Account(
                    BillingCountry = 'Brazil',
                    BillingState = 'Sao Paulo',
                    BillingCity = 'Sao Paulo',
                    BillingStreet = 'Paulista Ave.'
                ))
                .withGenerators(new Map<Schema.SObjectField, Generator> {
                    Account.Name => any('Jhon', 'Jennifer'),
                    Account.Phone => random(11111111, 99999999).asString()
                });

            Fixture.of(Account.class).addTemplate('invalid')
                .withGenerators(new Map<Schema.SObjectField, Generator> {
                    Account.BillingCountry => any('', null),
                    Account.Name => any('', null),
                    Account.Phone => random(-11111111, -99999999).asString()
                });
        }
    }

    @IsTest 
    private static void shouldLoadTemplates() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // when - loading it
        templateLoader.load();

        // then - templates were loaded
        Account validAccount = (Account) Fixture.pick(Account.class).create('valid');
        Account invalidAccount = (Account) Fixture.pick(Account.class).create('invalid');
    }

    @IsTest 
    private static void shouldCreateIdentityGenerator() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // then - generator of identity value was created
        IdentityGenerator generator = templateLoader.identity(1000);
    }

    @IsTest 
    private static void shouldCreateAnyGenerator() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // then - generator of any values was created
        AnyGenerator generator = templateLoader.any(0, 1);
    }

    @IsTest
    private static void shouldCreateRandomGenerator() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // then - generator of random numbers was created
        RandomGenerator generator = templateLoader.random(0, 1);
    }
    
}
