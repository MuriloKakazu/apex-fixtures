@IsTest(isParallel=true)
public class StringGeneratorTest {
    
    private class Validator {
        private Boolean isValid(Object value) {
            return (value instanceof String);
        }
    }

    @IsTest
    static void shouldGenerateString() {
        Generator generator = new StringGenerator(10);
        Validator validator = new Validator();

        Object generatedValue = generator.generate();
        System.assert(validator.isValid(generatedValue));
        System.assertEquals(10, ((String) generatedValue).length());
    }


}
