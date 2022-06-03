public with sharing class EmailGenerator extends StringGenerator {

    private static final Integer STRING_SIZE = 7;

    private final String domain;

    public EmailGenerator() {
        this('example.com');
    }

    public EmailGenerator(String domain) {
        super(STRING_SIZE);
        this.domain = domain;
    }


    public override Object generate() {
        return String.format('{0}@{1}', new Object[] { super.generate(), domain });
    }
}
