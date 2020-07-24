@IsTest
public class SomeAccountTest {

    static {
        FixtureLoader.loadTemplates(new Set<Type> {
            AccountTemplatesLoader.class
        });
    }
    
    @IsTest
    private static void testSomething0() {
        Account brazilianAccount0 = (Account) Fixture.pick(Account.class).create('brazilian');
        Account brazilianAccount1 = (Account) Fixture.pick(Account.class).create('brazilian');

        Account americanAccount0 = (Account) Fixture.pick(Account.class).create('american');
        Account americanAccount1 = (Account) Fixture.pick(Account.class).create('american');

        insert new List<Account> {
            brazilianAccount0, brazilianAccount1, americanAccount0, americanAccount1
        };
    }

}
