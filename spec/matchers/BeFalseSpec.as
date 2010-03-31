package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeFalseSpec extends Spec {
		
		public function BeFalseSpec() {
			should('match falses', function():void {
				expect(new BeFalse(false).match()).to(BeTrue);
			});
			
			should('not match trues', function():void {
				expect(new BeFalse(true).match()).to(BeFalse);
			});
			
			should('match empty strings', function():void {
				expect(new BeFalse('').match()).to(BeTrue);
			});

			should('not match strings with characters', function():void {
				expect(new BeFalse('hello').match()).to(BeFalse);
			});
			
			should('match 0s', function():void {
				expect(new BeFalse(0).match()).to(BeTrue);
			});
			
			should('not match any number other than 0', function():void {
				expect(new BeFalse(1).match()).to(BeFalse);
			});
		}
		
	}
	
}