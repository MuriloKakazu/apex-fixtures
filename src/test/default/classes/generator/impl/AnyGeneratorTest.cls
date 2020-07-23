@IsTest
public class AnyGeneratorTest {
    
    @IsTest
    private static void shouldGetAnyValueFromDataset() {
        // given - a dataset
        List<Object> dataset = new List<String> { 'Jhon', 'Jennifer', 'Robert' };
        
        // when - retrieving value
        Generator generator = new AnyGenerator(dataset);
        String value = (String) generator.generate();

        // then - retrieved value from dataset
        System.assertEquals(true, dataset.contains(value));
    }

}
