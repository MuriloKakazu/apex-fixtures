# Apex Fixtures

This is a simple Salesforce Apex lib, based on six2six's Java [Fixture Factory](https://github.com/six2six/fixture-factory), with the purpose of helping build and organize test data in a simple and efficient way.

## Usage

### Defining template

```apex
// Defining template using a prototype record

Fixture.of(Account.class).addTemplate('valid').withPrototype(new Account(
    Name = 'Jhon',
    Phone = '+5511940404040'
));
```

### Build object from template

```apex
// Build by template name

Account account = (Account) Fixture.pick(Account.class).create('valid');


// Or, build by template name and merge with another record

Account account = (Account) Fixture.pick(Account.class).create('valid', new Account(
    Description = 'Key Customer'
));
```