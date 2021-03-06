@IsTest
public class TemplateGeneratorsWrapperTest {
    
    @IsTest
    private static void shouldPushGenerators() {
        // given - a generators wrapper
        TemplateGeneratorsWrapper wrapper = new TemplateGeneratorsWrapper();

        // when - pushing generators
        wrapper.generator(Account.Name, new IdentityGenerator('Jhon'))
               .generator(Account.Phone, new IdentityGenerator('+5511940404040'));

        // then - wrapper contains generators
        System.assert(wrapper.getGenerators().containsKey('Name'));
        System.assert(wrapper.getGenerators().get('Name') instanceof IdentityGenerator);

        System.assert(wrapper.getGenerators().containsKey('Phone'));
        System.assert(wrapper.getGenerators().get('Phone') instanceof IdentityGenerator);
    }

}
