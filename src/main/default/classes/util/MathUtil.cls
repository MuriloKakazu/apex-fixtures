public class MathUtil {
    
    public static Double randomDouble(Double minValue, Double maxValue) {
        return minValue + (Math.random() * (maxValue - minValue));
    }

    public static Decimal randomDecimal(Decimal minValue, Decimal maxValue) {
        return minValue + (Math.random() * (maxValue - minValue));
    }

    public static Integer randomInteger(Integer minValue, Integer maxValue) {
        return Integer.valueOf(minValue + (Math.random() * (maxValue - minValue)));
    }
}
