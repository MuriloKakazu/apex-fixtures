@IsTest
public class PrimitiveConversionGeneratorsTest {
    
    @IsTest
    private static void shouldConvertToString() {
        Generator generator = new IdentityGenerator(100).asString();
        System.assertEquals('100', generator.generate());
    }

    @IsTest
    private static void shouldConvertToInteger() {
        Generator generator = new IdentityGenerator('100').asInteger();
        System.assertEquals(100, generator.generate());
    }

    @IsTest
    private static void shouldConvertToDouble() {
        Generator generator = new IdentityGenerator('100').asDouble();
        System.assertEquals(100.0, generator.generate());
    }

}
