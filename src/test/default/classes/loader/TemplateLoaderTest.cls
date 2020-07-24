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
                .withGenerators(
                     generator(Account.Name, any('Jhon', 'Jennifer'))
                    .generator(Account.Phone, random(11111111, 99999999).asString())
                );

            Fixture.of(Account.class).addTemplate('invalid')
                .withGenerators(
                     generator(Account.BillingCountry, any('', null))
                    .generator(Account.Name, any('', null))
                    .generator(Account.Phone, random(-11111111, -99999999).asString())
                );
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
    private static void shouldCreateIdentityGeneratorUsingAlias() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // then - generator of identity value was created
        IdentityGenerator generator = templateLoader.identity(1000);
    }

    @IsTest 
    private static void shouldCreateAnyGeneratorUsingAlias() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // then - generator of any values was created
        AnyGenerator generator = templateLoader.any(0, 1);
    }

    @IsTest
    private static void shouldCreateRandomGeneratorUsingAlias() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // then - generator of random numbers was created
        RandomGenerator generator = templateLoader.random(0, 1);
    }

    @IsTest
    private static void shouldCreateGeneratorsWrapperUsingAlias() {
        // given - a template loader
        AccountTemplateLoader templateLoader = new AccountTemplateLoader();

        // when - creating generators wrapper
        TemplateGeneratorsWrapper wrapper = templateLoader.generator(Account.Name, templateLoader.any('Jhon', 'Jennifer'));

        // then - wrapper contains generator
        System.assert(wrapper.getGenerators().containsKey('Name'));
        System.assert(wrapper.getGenerators().get('Name') instanceof AnyGenerator);
    }
    
}
