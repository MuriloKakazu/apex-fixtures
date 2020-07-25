@IsTest
public class AccountTemplatesLoader extends TemplateLoader {
    
    public override void load() {
        Fixture.of(Account.class).addTemplate('brazilian')
            .withPrototype(new Account(
                BillingCountry = 'Brazil',
                BillingState = 'SP',
                BillingCity = 'Sao Paulo',
                BillingStreet = 'Paulista Ave.'
            ))
            .withGenerators(
                 generator(Account.Name, any('João', 'Fernanda'))
                .generator(Account.Phone, random(11111111, 99999999).asString())
            );

        Fixture.of(Account.class).addTemplate('american')
            .withPrototype(new Account(
                BillingCountry = 'Unites States',
                BillingState = 'CA',
                BillingCity = 'San Francisco',
                BillingStreet = '20th St.'
            ))
            .withGenerators(
                 generator(Account.Name, any('Jhon', 'Jennifer'))
                .generator(Account.Phone, random(1111111111L, 9999999999L).asString())
            );
    }

}
