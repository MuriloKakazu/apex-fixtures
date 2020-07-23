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

}
