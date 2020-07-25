public class MathUtil {
    
    public static Double randomDouble(Double minValue, Double maxValue) {
        return minValue + (Math.random() * (maxValue - minValue));
    }

    public static Decimal randomDecimal(Decimal minValue, Decimal maxValue) {
        return minValue + (Math.random() * (maxValue - minValue));
    }

    public static Integer randomInteger(Integer minValue, Integer maxValue) {
        return minValue + Math.floor(Math.random() * (maxValue - minValue)).intValue();
    }

    public static Long randomLong(Long minValue, Long maxValue) {
        return randomDecimal(Decimal.valueOf(minValue), Decimal.valueOf(maxValue)).longValue();
    }
}
