@IsTest
public class RandomGeneratorTest {
    
    @IsTest
    private static void shouldGenerateRandomInteger() {
        // given - random boundaries
        Integer maxValue = 100;
        Integer minValue = -100;

        // when - generating random value
        Generator generator = new RandomGenerator(Integer.class, minValue, maxValue);
        Integer randomValue = (Integer) generator.generate();

        // then - generated value is within boundaries
        System.assert(randomValue >= minValue);
        System.assert(randomValue <= maxValue);
    }

    @IsTest
    private static void shouldGenerateRandomDouble() {
        // given - random boundaries
        Double maxValue = 100.0;
        Double minValue = -100.0;

        // when - generating random value
        Generator generator = new RandomGenerator(Double.class, minValue, maxValue);
        Double randomValue = (Double) generator.generate();

        // then - generated value is within boundaries
        System.assert(randomValue >= minValue);
        System.assert(randomValue <= maxValue);
    }

    @IsTest
    private static void shouldGenerateRandomDecimal() {
        // given - random boundaries
        Decimal maxValue = 100;
        Decimal minValue = -100;

        // when - generating random value
        Generator generator = new RandomGenerator(Decimal.class, minValue, maxValue);
        Decimal randomValue = (Decimal) generator.generate();

        // then - generated value is within boundaries
        System.assert(randomValue >= minValue);
        System.assert(randomValue <= maxValue);
    }
    

}
