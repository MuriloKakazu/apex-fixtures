/*
    IMPORTANT: It converts to String before converting to the desired type
               otherwise Apex will behave in a very inconsistent manner.

    For some numeric types, Apex will truncate, other times overflow:
        Object x = (Decimal) 2147483648.0;
        System.debug(Integer.valueOf(x)); => -2147483648 OVERFLOW!

        Object y = (Double) 2147483648.0;
        System.debug(Integer.valueOf(y)); => 2147483647 TRUNCATE!

        But, if we convert to String, at least it consistently refuses the conversion for both:
        System.debug(Integer.valueOf(String.valueOf(x))); => Invalid integer: 2147483648.0
        System.debug(Integer.valueOf(String.valueOf(y))); => Invalid integer: 2.147483648E9

    Also, Apex will consider Double as an instance of Decimal and vice-versa when checking types with instanceof,
    so there is no way to circumvent the behavior above with logic operators. See for yourself:
        Object x = (Decimal) 0;
        System.debug(x instanceof Decimal); => TRUE
        System.debug(x instanceof Double);  => TRUE

        Object y = (Double)  0;
        System.debug(y instanceof Decimal); => TRUE
        System.debug(y instanceof Double);  => TRUE

     Also, Apex allows NaN for Double, but not for other numeric types.
         Integer.valueOf('NaN'); => EXCEPTION
         Double.valueOf('NaN');  => NaN
         Decimal.valueOf('NaN'); => EXCEPTION
         Long.valueOf('NaN');    => EXCEPTION

    It seems we can't differentiate Decimal and Double, but Apex conveniently does so internally somehow.
    So I went the way to convert the value to String since it's shown to be the safest and most consistent.
 */
public class ConversionUtil {

    public static Integer convertToInteger(Object value) {
        return Integer.valueOf(String.valueOf(value));
    }

    public static Long convertToLong(Object value) {
        return Long.valueOf(String.valueOf(value));
    }

    public static Double convertToDouble(Object value) {

        // Ensure consistency since Apex throws this exception for other numeric primitives,
        // but not for Double for some reason
        if ('NaN'.equals(value)) throw new TypeException('Invalid double: NaN');

        return Double.valueOf(String.valueOf(value));
    }

    public static Decimal convertToDecimal(Object value) {
        return Decimal.valueOf(String.valueOf(value));
    }

}