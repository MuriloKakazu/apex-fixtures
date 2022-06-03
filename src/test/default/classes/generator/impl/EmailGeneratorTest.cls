@IsTest(isParallel=true)
public class EmailGeneratorTest {
    
    private class Validator {
        private Boolean isValid(String email) {
            Pattern simplifiedEmailPattern = Pattern.compile('^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-zA-Z0-9]+$');
            Matcher matcher = simplifiedEmailPattern.matcher(email);
            return matcher.matches();
        }
    }

    @IsTest
    static void shouldGenerateEmail() {
        Generator generator = new EmailGenerator();
        Validator validator = new Validator();

        System.assert(validator.isValid((String) generator.generate()));
    }

    @IsTest
    static void shouldGenerateEmailWithCustomDomain() {
        Generator generator = new EmailGenerator('salesforce.com');
        Validator validator = new Validator();

        String generatedValue = (String) generator.generate();
        System.assert(validator.isValid(generatedValue));
        System.assert(generatedValue.endsWith('@salesforce.com'));
    }

}
