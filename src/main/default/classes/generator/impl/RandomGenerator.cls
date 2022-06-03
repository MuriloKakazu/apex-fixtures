public class RandomGenerator extends ConvertableGenerator {
    private Type returnType;
    private Object minValue;
    private Object maxValue;

    public RandomGenerator(Type returnType, Object minValue, Object maxValue) {
        this.returnType = returnType;
        this.minValue = minValue;
        this.maxValue = maxValue;
    }

    public override Object generate() {
        if (returnType == Integer.class) {
            return MathUtil.randomInteger((Integer) minValue, (Integer) maxValue);
        }
        if (returnType == Double.class) {
            return MathUtil.randomDouble((Double) minValue, (Double) maxValue);
        }
        if (returnType == Decimal.class) {
            return MathUtil.randomDecimal((Decimal) minValue, (Decimal) maxValue);
        }
        if (returnType == Long.class) {
            return MathUtil.randomLong((Long) minValue, (Long) maxValue);
        }
        if (returnType == Date.class) {
            return DateUtil.getRandomDateBetween((Date) minValue, (Date) maxValue);
        }
        if (returnType == DateTime.class) {
            return DateUtil.getRandomDateTimeBetween((DateTime) minValue, (DateTime) maxValue);
        }
        throw new UnsupportedOperationException('Can not generate random number for this type: ' + returnType.getName());
    }
}
