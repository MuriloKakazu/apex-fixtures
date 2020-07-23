public abstract class AbstractGenerator implements Generator {
    public abstract Object generate();

    public Generator asString() {
        return new PrimitiveConversionGenerators.ToString(this);
    }

    public Generator asInteger() {
        return new PrimitiveConversionGenerators.ToInteger(this);
    }
    
    public Generator asDouble() {
        return new PrimitiveConversionGenerators.ToDouble(this);
    }
}
