package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class MatchSpec extends Spec {
		
		public function MatchSpec() {
			should('match regexes of strings', function():void {
				expect(new Match('Hello world', /hello/i).match()).to(BeTrue);
				expect(new Match('Hello world', /hi/i).match()).to(BeFalse);
			});
			
			should('match substrings of strings', function():void {
				expect(new Match('Hello world', 'Hello').match()).to(BeTrue);
				expect(new Match('Hello world', 'hi').match()).to(BeFalse);
			});
		}
		
	}
	
}