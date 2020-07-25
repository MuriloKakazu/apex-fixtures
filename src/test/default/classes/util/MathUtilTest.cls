@IsTest
public class MathUtilTest {
    
    @IsTest
    private static void shouldGenerateRandomIntegers() {
        // given - possible generated integers are [-50, ... , 50]
        Integer minValue = -50;
        Integer maxValue = 50;

        Set<Integer> generatedSet = new Set<Integer>();

        // for 1000 iterations
        for (Integer i = 0; i < 1000; i++) {
            Integer randomValue = MathUtil.randomInteger(minValue, maxValue);
            generatedSet.add(randomValue);

            // assert generated number is within boundaries
            System.assert(randomValue >= minValue);
            System.assert(randomValue <= maxValue);
        }

        // and - assert generated set has a reasonable amount of unique numbers
        System.assert(generatedSet.size() >= 40);
    }

    @IsTest
    private static void shouldGenerateRandomDoubles() {
        // given - possible generated rational numbers are [-1.0, ..., 1.0]
        Double minValue = -1.0;
        Double maxValue = 1.0;

        Set<Double> generatedSet = new Set<Double>();

        // for 1000 iterations
        for (Integer i = 0; i < 1000; i++) {
            Double randomValue = MathUtil.randomDouble(minValue, maxValue);
            generatedSet.add(randomValue);

            // assert generated number is within boundaries
            System.assert(randomValue >= minValue);
            System.assert(randomValue <= maxValue);
        }

        // and - assert generated set has a reasonable amount of unique numbers
        System.assert(generatedSet.size() >= 900);
    }

    @IsTest
    private static void shouldGenerateRandomDecimals() {
        // given - possible generated rational numbers are [-1.0, ..., 1.0]
        Decimal minValue = -1.0;
        Decimal maxValue = 1.0;

        Set<Decimal> generatedSet = new Set<Decimal>();

        // for 1000 iterations
        for (Integer i = 0; i < 1000; i++) {
            Decimal randomValue = MathUtil.randomDecimal(minValue, maxValue);
            generatedSet.add(randomValue);

            // assert generated number is within boundaries
            System.assert(randomValue >= minValue);
            System.assert(randomValue <= maxValue);
        }

        // and - assert generated set has a reasonable amount of unique numbers
        System.assert(generatedSet.size() >= 900);
    }

    @IsTest
    private static void shouldGenerateRandomLongs() {
        // given - a range with 100 numbers in between
        Long minValue = 9223372036854775707L;
        Long maxValue = 9223372036854775807L;

        Set<Long> generatedSet = new Set<Long>();

        // for 1000 iterations
        for (Integer i = 0; i < 1000; i++) {
            Long randomValue = MathUtil.randomLong(minValue, maxValue);
            generatedSet.add(randomValue);

            // assert generated number is within boundaries
            System.assert(randomValue >= minValue);
            System.assert(randomValue <= maxValue);
        }

        // and - assert generated set has a reasonable amount of unique numbers
        System.assert(generatedSet.size() >= 40);
    }

}
