@IsTest
public class PrimitiveConversionGeneratorsTest {
    
    @IsTest
    private static void shouldConvertToString() {
        for (Object testValue : new Set<Object> { '100', 100, 100L }) {
            Generator generator = new IdentityGenerator(testValue).asString();
            System.assertEquals('100', generator.generate());
        }

        // doubles and decimals are represented as rational numbers
        for (Object testValue : new Set<Object> { (Double) 100.0, (Decimal) 100.0 }) {
            Generator generator = new IdentityGenerator(testValue).asString();
            System.assertEquals('100.0', generator.generate());
        }
    }

    @IsTest
    private static void shouldConvertToInteger() {
        for (Object testValue : new Set<Object> { '100', 100, 100L }) {
            Generator generator = new IdentityGenerator(testValue).asInteger();
            System.assertEquals(100, generator.generate());
        }
    }

    @IsTest
    private static void shouldConvertToDouble() {
        for (Object testValue : new Set<Object> { '100', 100, 100L, (Double) 100.0, (Decimal) 100.0 }) {
            Generator generator = new IdentityGenerator(testValue).asDouble();
            System.assertEquals((Double) 100.0, generator.generate());
        }
    }

    @IsTest
    private static void shouldConvertToDecimal() {
        for (Object testValue : new Set<Object> { '100', 100, 100L, (Double) 100.0, (Decimal) 100.0 }) {
            Generator generator = new IdentityGenerator(testValue).asDecimal();
            System.assertEquals((Decimal) 100.0, generator.generate());
        }
    }

    @IsTest
    private static void shouldConvertToLong() {
        for (Object testValue : new Set<Object> { '100', 100, 100L, (Double) 100.0, (Decimal) 100.0 }) {
            Generator generator = new IdentityGenerator(testValue).asLong();
            System.assertEquals(100L, generator.generate());
        }
    }

}
