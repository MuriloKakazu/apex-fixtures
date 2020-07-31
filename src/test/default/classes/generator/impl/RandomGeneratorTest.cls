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
    
    @IsTest
    private static void shouldGenerateRandomLong() {
        // given - random boundaries
        Long maxValue = 100L;
        Long minValue = -100L;

        // when - generating random value
        Generator generator = new RandomGenerator(Long.class, minValue, maxValue);
        Long randomValue = (Long) generator.generate();

        // then - generated value is within boundaries
        System.assert(randomValue >= minValue);
        System.assert(randomValue <= maxValue);
    }

    @IsTest
    private static void shouldGenerateRandomDate() {
        // given - random boundaries
        Date minValue = Date.today();
        Date maxValue = Date.today().addMonths(1);

        // when - generating random value
        Generator generator = new RandomGenerator(Date.class, minValue, maxValue);
        Date randomValue = (Date) generator.generate();

        // then - generated value is within boundaries
        System.assert(randomValue >= minValue);
        System.assert(randomValue <= maxValue);
    }

    @IsTest
    private static void shouldGenerateRandomDateTime() {
        // given - random boundaries
        DateTime minValue = DateTime.now();
        DateTime maxValue = DateTime.now().addDays(1);

        // when - generating random value
        Generator generator = new RandomGenerator(DateTime.class, minValue, maxValue);
        DateTime randomValue = (DateTime) generator.generate();

        // then - generated value is within boundaries
        System.assert(randomValue >= minValue);
        System.assert(randomValue <= maxValue);
    }

}
