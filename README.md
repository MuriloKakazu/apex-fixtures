# Apex Fixtures

This is a simple Salesforce Apex lib, based on six2six's Java [Fixture Factory](https://github.com/six2six/fixture-factory), with the purpose of helping build and organize test data in a simple and efficient way.

## Usage

### Defining template

```apex
Fixture.of(Account.class).addTemplate('valid', new Template()
    .put('Name', 'Test')
    .put('Phone', '+5511940404040')
);

// or

Fixture.of(Account.class).addTemplate('valid', new Map<String, Object> {
    'Name' => 'Test',
    'Phone' => '+5511940404040'
});
```

### Build object from template

Note that you can also provide a prototype, so that it's applied on top of the template

```apex
Fixture.pick(Account.class).create('valid');

// or

Fixture.pick(Account.class).create('valid', new Account(
    Mobile = '+5511990909090'
));
```