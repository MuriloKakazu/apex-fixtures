@IsTest
public class ObjectFactoryTest {
    
    @IsTest
    private static void shouldCreateObjectUsingTemplate() {
        // given - template
        TemplateHolder templates = new TemplateHolder(Account.class);
        templates.addTemplate('example').withPrototype(new Account(
            Name = 'Jhon',
            Phone = '+5511940404040'
        ));

        // when - creating object
        ObjectFactory factory = new ObjectFactory(templates);
        Account account = (Account) factory.create('example');

        // then - template properties were used
        System.assertEquals('Jhon', account.Name);
        System.assertEquals('+5511940404040', account.Phone);
    }

    @IsTest
    private static void shouldCreateObjectMergingWithTemplate() {
        // given - template
        TemplateHolder templates = new TemplateHolder(Account.class);
        templates.addTemplate('example').withPrototype(new Account(
            Name = 'Jhon',
            Phone = '+5511940404040'
        ));

        // when - creating object
        ObjectFactory factory = new ObjectFactory(templates);
        Account account = (Account) factory.create('example', new Account(Description = 'Key Customer'));

        // then - template properties were used
        System.assertEquals('Jhon', account.Name);
        System.assertEquals('+5511940404040', account.Phone);

        // and - was merged with record
        System.assertEquals('Key Customer', account.Description);
    }

    @IsTest
    private static void shouldCreateObjectOverwrittingTemplateProperty() {
        // given - template
        TemplateHolder templates = new TemplateHolder(Account.class);
        templates.addTemplate('example').withPrototype(new Account(
            Name = 'Jhon',
            Phone = '+5511940404040'
        ));

        // when - creating object
        ObjectFactory factory = new ObjectFactory(templates);
        Account account = (Account) factory.create('example', new Account(Phone = '+5511970707070'));

        // then - template properties were used
        System.assertEquals('Jhon', account.Name);

        // and - value was overwritten
        System.assertEquals('+5511970707070', account.Phone);
    }

}
