Fixture.of(Account.class).addTemplate('valid', new Template()
    .put('Name', 'Test')
);

Fixture.pick(Account.class).create('valid', new Account(
    Phone = '+5511990909090'
));