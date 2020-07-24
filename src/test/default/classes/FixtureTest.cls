@IsTest
public class FixtureTest {
    
    @IsTest
    private static void shouldCreateFixtureDataUsingPrototype() {
        // given - template added
        Fixture.of(Account.class).addTemplate('valid')
            .withPrototype(new Account(
                Name = 'Jhon',
                Phone = '+5511940404040'
            ));

        // when - creating fixture data
        Account account = (Account) Fixture.pick(Account.class).create('valid');

        // then - fixture data was created based on prototype
        System.assertEquals('Jhon', account.Name);
        System.assertEquals('+5511940404040', account.Phone);
    }

    @IsTest
    private static void shouldCreateFixtureDataUsingGenerators() {
        // given - template added
        Fixture.of(Account.class).addTemplate('valid')
            .withGenerators(new Map<Schema.SObjectField, Generator> {
                Account.Name => new AnyGenerator(new List<Object>{ 'Jhon', 'Jennifer' }),
                Account.Phone => new RandomGenerator(Integer.class, 11111111, 99999999).asString()
            });

        // when - creating fixture data
        Account account = (Account) Fixture.pick(Account.class).create('valid');

        // then - fixture data was created with generators
        System.assertEquals(true, new Set<String> { 'Jhon', 'Jennifer' }.contains(account.Name));
        System.assertEquals(8, account.Phone.length());
    }

    @IsTest
    private static void shouldCreateFixtureDataUsingPrototypeAndGenerators() {
        // given - template added
        Fixture.of(Account.class).addTemplate('valid')
            .withPrototype(new Account(
                BillingCountry = 'Brazil',
                BillingState = 'Sao Paulo',
                BillingCity = 'Sao Paulo',
                BillingStreet = 'Paulista Ave.'
            ))
            .withGenerators(new Map <Schema.SObjectField, Generator> {
                Account.Name => new AnyGenerator(new List<Object> { 'Jhon', 'Jennifer' }),
                Account.Phone => new RandomGenerator(Integer.class, 11111111, 99999999).asString()
            });

        // when - creating fixture data
        Account account = (Account) Fixture.pick(Account.class).create('valid');

        // then - fixture data was created based on prototype
        System.assertEquals('Brazil', account.BillingCountry);
        System.assertEquals('Sao Paulo', account.BillingState);
        System.assertEquals('Sao Paulo', account.BillingCity);
        System.assertEquals('Paulista Ave.', account.BillingStreet);

        // and - fixture data was created with generators
        System.assertEquals(true, new Set<String> { 'Jhon', 'Jennifer' }.contains(account.Name));
        System.assertEquals(8, account.Phone.length());
    }

}
