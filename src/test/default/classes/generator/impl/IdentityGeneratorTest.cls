@IsTest
public class IdentityGeneratorTest {
    
    @IsTest
    private static void shouldGenerateProvidedValue() {
        // given
        String value = 'NCC-1701';
        Generator valueGenerator = new IdentityGenerator(value);

        // then
        System.assertEquals(value, valueGenerator.generate());
    }

}
