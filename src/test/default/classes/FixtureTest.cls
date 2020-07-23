@IsTest
public class FixtureTest {
    
    @IsTest
    private static void shouldCreateFixtureData() {
        // given - template added
        Fixture.of(Account.class).addTemplate('valid').withPrototype(new Account(
            Name = 'Jhon',
            Phone = '+5511940404040'
        ));

        // when - creating fixture data
        Account account = (Account) Fixture.pick(Account.class).create('valid');

        // then - fixture data is created based on template
        System.assertEquals('Jhon', account.Name);
        System.assertEquals('+5511940404040', account.Phone);
    }

    @IsTest
    private static void shouldCreateGeneratedFixtureData() {
        // given - template added
        Fixture.of(Account.class).addTemplate('valid').withGenerators(new Map<Schema.SObjectField, Generator> {
            Account.Name => new AnyGenerator('Jhon', 'Jennifer'),
            Account.Phone => new RandomGenerator(11111111, 99999999).asString()
        });

        // when - creating fixture data
        Account account = (Account) Fixture.pick(Account.class).create('valid');

        // then - fixture data is created based on template
        System.assertEquals(true, new Set<String> { 'Jhon', 'Jennifer' }.contains(account.Name));
        System.assertEquals(8, account.Phone.length());
    }

}
