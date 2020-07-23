public class RandomGenerator implements Generator {
    private Type returnType;
    private Object minValue;
    private Object maxValue;

    public RandomGenerator(Integer minValue, Integer maxValue) {
        this.returnType = Integer.class;
        this.minValue = minValue;
        this.maxValue = maxValue;
    }

    public RandomGenerator(Double minValue, Double maxValue) {
        this.returnType = Double.class;
        this.minValue = minValue;
        this.maxValue = maxValue;
    }

    public RandomGenerator(Decimal minValue, Decimal maxValue) {
        this.returnType = Decimal.class;
        this.minValue = minValue;
        this.maxValue = maxValue;
    }

    public Object generate() {
        if (returnType == Integer.class) {
            return MathUtil.randomInteger((Integer) minValue, (Integer) maxValue);
        }
        if (returnType == Double.class) {
            return MathUtil.randomDouble((Double) minValue, (Double) maxValue);
        }
        if (returnType == Decimal.class) {
            return MathUtil.randomDecimal((Decimal) minValue, (Decimal) maxValue);
        }
        throw new UnsupportedOperationException('Can not generate random number for this type: ' + returnType.getName());
    }
}
