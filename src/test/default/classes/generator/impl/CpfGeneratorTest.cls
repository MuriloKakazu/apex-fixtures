@IsTest
public class CpfGeneratorTest {

    private class Validator {
        private Boolean isValid(String unformattedCpf) {
            String[] digits = unformattedCpf.split('');

            Integer digit1 = int(digits[0]),
                    digit2 = int(digits[1]),
                    digit3 = int(digits[2]),
                    digit4 = int(digits[3]),
                    digit5 = int(digits[4]),
                    digit6 = int(digits[5]),
                    digit7 = int(digits[6]),
                    digit8 = int(digits[7]),
                    digit9 = int(digits[8]),
                    digit10 = int(digits[9]),
                    digit11 = int(digits[10]);

            Integer expectedDigit10 = (digit1 * 10 + digit2 * 9 + digit3 * 8 + digit4 * 7 + 
                                       digit5 * 6 + digit6 * 5 + digit7 * 4 + digit8 * 3 + digit9 * 2);
            expectedDigit10 = Math.mod(expectedDigit10, 11);
            expectedDigit10 = (expectedDigit10 <= 1)? 0 : 11 - expectedDigit10;

            Integer expectedDigit11 = (digit1 * 11 + digit2 * 10 + digit3 * 9 + digit4 * 8 + digit5 * 7 + 
                                       digit6 * 6 + digit7 * 5 + digit8 * 4 + digit9 * 3 + expectedDigit10 * 2);
            expectedDigit11 = Math.mod(expectedDigit11, 11);
            expectedDigit11 = (expectedDigit11 <= 1)? 0 : 11 - expectedDigit11;

            return digit10 == expectedDigit10 && digit11 == expectedDigit11;
        }

        private Integer int(String value) {
            return Integer.valueof(value);
        }
    }

    @IsTest
    private static void shouldGenerateValidCpfs() {
        // given - generator, validator
        Generator generator = new CpfGenerator();
        Validator validator = new Validator();

        // then - validator validates generated data
        for (Integer i = 0; i < 25; i++) {
            System.assert(validator.isValid((String) generator.generate()));
        }
    }
}
