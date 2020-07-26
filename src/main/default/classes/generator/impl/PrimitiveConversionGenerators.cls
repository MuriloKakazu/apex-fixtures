public class PrimitiveConversionGenerators {
    private abstract class PrimitiveConversionGenerator implements Generator {
        private Generator baseGenerator;

        public PrimitiveConversionGenerator(Generator baseGenerator) {
            this.baseGenerator = baseGenerator;
        }

        public abstract Object generate();
    }

    public class ToString extends PrimitiveConversionGenerator {
        public ToString(Generator baseGenerator) {
            super(baseGenerator);
        }

        public override Object generate() {
            return String.valueOf(baseGenerator.generate());
        }
    }

    public class ToInteger extends PrimitiveConversionGenerator {
        public ToInteger(Generator baseGenerator) {
            super(baseGenerator);
        }

        public override Object generate() {
            return ConversionUtil.convertToInteger(baseGenerator.generate());
        }
    }

    public class ToDouble extends PrimitiveConversionGenerator {
        public ToDouble(Generator baseGenerator) {
            super(baseGenerator);
        }

        public override Object generate() {
            return ConversionUtil.convertToDouble(baseGenerator.generate());
        }
    }

    public class ToDecimal extends PrimitiveConversionGenerator {
        public ToDecimal(Generator baseGenerator) {
            super(baseGenerator);
        }

        public override Object generate() {
            return ConversionUtil.convertToDecimal(baseGenerator.generate());
        }

    }

    public class ToLong extends PrimitiveConversionGenerator {
        public ToLong(Generator baseGenerator) {
            super(baseGenerator);
        }

        public override Object generate() {
            return ConversionUtil.convertToLong(baseGenerator.generate());
        }
    }
}
