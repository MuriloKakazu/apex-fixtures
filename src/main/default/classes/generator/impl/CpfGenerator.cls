public class CpfGenerator implements Generator {

    private Boolean formatted = false;

    public Object generate() {
        Integer digit1 = randomDigit(),
                digit2 = randomDigit(),
                digit3 = randomDigit(),
                digit4 = randomDigit(),
                digit5 = randomDigit(),
                digit6 = randomDigit(),
                digit7 = randomDigit(),
                digit8 = randomDigit(),
                digit9 = randomDigit();

        Integer digit10 = (digit1 * 10 + digit2 * 9 + digit3 * 8 + digit4 * 7 + 
                           digit5 * 6 + digit6 * 5 + digit7 * 4 + digit8 * 3 + digit9 * 2);
        digit10 = Math.mod(digit10, 11);
        digit10 = (digit10 <= 1)? 0 : 11 - digit10;

        Integer digit11 = (digit1 * 11 + digit2 * 10 + digit3 * 9 + digit4 * 8 + digit5 * 7 + 
                           digit6 * 6 + digit7 * 5 + digit8 * 4 + digit9 * 3 + digit10 * 2);
        digit11 = Math.mod(digit11, 11);
        digit11 = (digit11 <= 1)? 0 : 11 - digit11;

        String format = formatted? '{0}{1}{2}.{3}{4}{5}.{6}{7}{8}-{9}{10}' : '{0}{1}{2}{3}{4}{5}{6}{7}{8}{9}{10}';
        return String.format(format, new List<Object> { 
            digit1, digit2, digit3, digit4, digit5, digit6, 
            digit7, digit8, digit9, digit10, digit11 });
    }

    public Generator formatted() {
        this.formatted = true;
        return this;
    }

    private Integer randomDigit() {
        return MathUtil.randomInteger(0, 9);
    }

}
