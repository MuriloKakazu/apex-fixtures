# Apex Fixtures

This is a simple Salesforce Apex lib, based on six2six's Java [Fixture Factory](https://github.com/six2six/fixture-factory), with the purpose of helping build and organize test data in a simple and efficient way.

## Usage

### Defining template

```apex
Fixture.of(Account.class).addTemplate('valid').withPrototype(new Account(
    Name = 'Jhon',
    Phone = '+5511940404040'
))
```

### Build object from template

Note that you can also provide an existing record, so that it overrides the template field values

```apex
Account account = (Account) Fixture.pick(Account.class).create('valid');

// or

Account account = (Account) Fixture.pick(Account.class).create('valid', new Account(
    Mobile = '+5511990909090'
));
```