public virtual with sharing class StringGenerator implements Generator {

    private static final String CHARS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';

    private final Integer size;

    public StringGenerator(Integer size) {
        this.size = size;
    }

    public virtual Object generate() {
        String generatedString = '';
        while (generatedString.length() < size) {
            Integer randomCharIndex = Math.mod(Math.abs(Crypto.getRandomInteger()), CHARS.length());
            generatedString += CHARS.substring(randomCharIndex, randomCharIndex+1);
        }
        return generatedString; 
    }
}
