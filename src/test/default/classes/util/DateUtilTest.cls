@IsTest
public class DateUtilTest {

    @IsTest
    private static void shouldGenerateRandomDates() {
        // given - range between today and same day next month
        Date minValue = Date.today();
        Date maxValue = Date.today().addMonths(1);

        Set<Date> generatedSet = new Set<Date>();

        // for 1000 iterations
        for (Integer i = 0; i < 1000; i++) {
            Date randomValue = DateUtil.getRandomDateBetween(minValue, maxValue);
            generatedSet.add(randomValue);

            // assert generated value is within boundaries
            System.assert(randomValue >= minValue);
            System.assert(randomValue <= maxValue);
        }

        // and - assert generated set has a reasonable amount of unique values
        System.assert(generatedSet.size() >= 20);
    }


    @IsTest
    private static void shouldGenerateRandomDateTimes() {
        // given - range between today and same day next month
        DateTime minValue = DateTime.now();
        DateTime maxValue = DateTime.now().addDays(1);

        Set<DateTime> generatedSet = new Set<DateTime>();

        // for 1000 iterations
        for (Integer i = 0; i < 1000; i++) {
            DateTime randomValue = DateUtil.getRandomDateTimeBetween(minValue, maxValue);
            generatedSet.add(randomValue);

            // assert generated value is within boundaries
            System.assert(randomValue >= minValue);
            System.assert(randomValue <= maxValue);
        }

        // and - assert generated set has a reasonable amount of unique values
        System.assert(generatedSet.size() >= 700);
    }
}