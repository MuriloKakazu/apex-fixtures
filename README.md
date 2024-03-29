# Apex Fixtures

This is a simple Salesforce Apex lib, based on six2six's Java [Fixture Factory](https://github.com/six2six/fixture-factory), 
with the purpose of helping build and organize test data in a simple and efficient way.

## Usage

You can check out the [sample code](https://github.com/MuriloKakazu/apex-fixtures/tree/master/samples) or just follow along with the docs.

### Defining templates

You can define multiple templates for each SObject type. 
Template names can only repeat for different SObject types.

The template fields can be defined using a prototype SObject for fixed data, 
and generators for generated data. 
It's not required that you use both ways 
(i.e. you can define a template just using fixed data, or just using generators).

An example of a template definition using a mix of fixed and generated data looks like so:

```apex
Fixture.of(Account.class).addTemplate('valid')
    .withPrototype(new Account(
        BillingCountry = 'Brazil',
        BillingState = 'Sao Paulo',
        BillingCity = 'Sao Paulo',
        BillingStreet = 'Paulista Ave.'
    ))
    .withGenerators(
         generator(Account.Name, any('Jhon', 'Jennifer'))
        .generator(Account.Phone, random(1111111111L, 1199999999L).asString())
        .generator(Account.LegalIdentification__c, cpf().formatted())
    );
```

#### Generators

Generators are useful for providing randomly generated or randomly picked data to the records.

Alias                  | Description                                                        
-----                  | ----------- 
identity(any)          | return the provided param
any(list)              | returns a random element from the list
random(min, max)       | returns a random value in a range. Supports `Integer`, `Long`, `Double`, `Decimal`, `Date`, `DateTime` as params
randomString(size)     | returns a random alphanumeric string of the specified size
email(), email(domain) | returns a random email address, optionally specifying the domain
cpf()                  | returns a random brazilian natural person identification number. Supports `.formatted()`

#### Converters

Some generators allow the data to be converted to another primitive type. 
They can be called just after the generators. 
e.g: `random(0, 100).asString()`

Alias           | Description                                                        
-----           | -----------
asString()      | converts value to String
asInteger()     | converts value to Integer
asLong()        | converts value to Long
asDouble()      | converts value to Double
asDecimal()     | converts value to Decimal

### Create objects using templates

#### Just pass the template name

```apex
Account account = (Account) Fixture.pick(Account.class).create('valid');
```
#### Or pass a prototype as well

Passing a prototype will merge the objects. 
The prototype fields's values overwrite the template ones.

```apex
Account account = (Account) Fixture.pick(Account.class).create('valid', new Account(
    Name = 'Tesla, Inc.'
));
```