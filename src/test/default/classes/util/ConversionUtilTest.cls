@IsTest
public class ConversionUtilTest {

    @IsTest
    private static void willConvertToInteger() {

        for (Object testValue : new Set<Object> {
                // numbers with no decimal place
                '100', 100, 100L, (Double) 100, (Decimal) 100,
                // numbers in which decimal place is just 0s
                '100.000', (Double) 100.000, (Decimal) 100.000 }) {

            System.assertEquals(100, ConversionUtil.convertToInteger(testValue));
        }

    }

    @IsTest
    private static void willNotConvertToInteger() {

        for (Object testValue : new Set<Object> {
                // null, NaN, non-numerics
                null, 'NaN', 'abc',
                // numbers with decimal places
                '100.5', (Double) 100.1, (Decimal) 100.1,
                // numbers out of int32 bounds
                '2147483648', 2147483648L, (Double) 2147483648.0, (Decimal) 2147483648.0,
                '-2147483649', -2147483649L, (Double) -2147483649.0, (Decimal) -2147483649.0 }) {

            try {
                ConversionUtil.convertToInteger(testValue);
                System.assert(false, 'Should have thrown exception');
            } catch (TypeException e) {
            } catch (NullPointerException e) { }
        }

    }

    @IsTest
    private static void willConvertToLong() {

        for (Object testValue : new Set<Object> {
                // numbers with no decimal place
                '100', 100, 100L, (Double) 100, (Decimal) 100,
                // numbers in which decimal place is just 0s
                '100.000', (Double) 100.000, (Decimal) 100.000 }) {

            System.assertEquals(100L, ConversionUtil.convertToLong(testValue));
        }

    }

    @IsTest
    private static void willNotConvertToLong() {

        for (Object testValue : new Set<Object> {
                // null, NaN, non-numerics
                null, 'NaN', 'abc',
                // numbers with decimal places
                '100.5', (Double) 100.1, (Decimal) 100.1,
                // numbers out of int64 bounds
                '9223372036854775808', (Double) 9223372036854775808.0, (Decimal) 9223372036854775808.0,
                '-9223372036854775809', (Double) -9223372036854775809.0, (Decimal) -9223372036854775809.0 }) {

            try {
                ConversionUtil.convertToLong(testValue);
                System.assert(false, 'Should have thrown exception');
            } catch (TypeException e) {
            } catch (NullPointerException e) { }
        }

    }

    @IsTest
    private static void willConvertToDouble() {

        for (Object testValue : new Set<Object> {
                // numbers with no decimal place
                '100', 100, 100L, (Double) 100, (Decimal) 100 }) {

            System.assertEquals((Double) 100.0, ConversionUtil.convertToDouble(testValue));
        }

        for (Object testValue : new Set<Object> {
                // numbers with decimal places
                '100.123', (Double) 100.123, (Decimal) 100.123 }) {

            System.assertEquals((Double) 100.123, ConversionUtil.convertToDouble(testValue));
        }

    }

    @IsTest
    private static void willNotConvertToDouble() {

        for (Object testValue : new Set<Object> {
                // null, NaN, non-numerics
                null, 'NaN', 'abc' }) {

            try {
                ConversionUtil.convertToDouble(testValue);
                System.assert(false, 'Should have thrown exception');
            } catch (TypeException e) {
            } catch (NullPointerException e) { }
        }

    }

    @IsTest
    private static void willConvertToDecimal() {

        for (Object testValue : new Set<Object> {
                // numbers with no decimal place
                '100', 100, 100L, (Double) 100, (Decimal) 100 }) {

            System.assertEquals((Decimal) 100.0, ConversionUtil.convertToDecimal(testValue));
        }

        for (Object testValue : new Set<Object> {
                // numbers with decimal places
                '100.123', (Double) 100.123, (Decimal) 100.123 }) {

            System.assertEquals((Decimal) 100.123, ConversionUtil.convertToDecimal(testValue));
        }

    }

    @IsTest
    private static void willNotConvertToDecimal() {

        for (Object testValue : new Set<Object> {
                // null, NaN, non-numerics
                null, 'NaN', 'abc' }) {

            try {
                ConversionUtil.convertToDecimal(testValue);
                System.assert(false, 'Should have thrown exception');
            } catch (TypeException e) {
            } catch (NullPointerException e) { }
        }

    }
}