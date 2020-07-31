public class DateUtil {

    private DateUtil() { }

    public static Date getRandomDateBetween(Date minDate, Date maxDate) {
        Integer daysBetween = minDate.daysBetween(maxDate);
        return minDate.addDays(MathUtil.randomInteger(0, daysBetween));
    }

    public static DateTime getRandomDateTimeBetween(DateTime minDateTime, DateTime maxDateTime) {
        Long millisBetween = maxDateTime.getTime() - minDateTime.getTime();
        Integer secondsBetween = Math.floor(millisBetween / 1000L).intValue();
        return minDateTime.addSeconds(MathUtil.randomInteger(0, secondsBetween));
    }

}