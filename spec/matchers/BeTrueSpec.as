package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeTrueSpec extends Spec {
		
		public function BeTrueSpec() {
			should('match trues', function():void {
				expect(new BeTrue(true).match()).to(BeTrue);
			});
			
			should('not match falses', function():void {
				expect(new BeTrue(false).match()).to(BeFalse);
			});
			
			should('match strings with characters', function():void {
				expect(new BeTrue('hello').match()).to(BeTrue);
			});
			
			should('not match empty strings', function():void {
				expect(new BeTrue('').match()).to(BeFalse);
			});
			
			should('match any number other than 0', function():void {
				expect(new BeTrue(1).match()).to(BeTrue);
			});
			
			should('not match 0s', function():void {
				expect(new BeTrue(0).match()).to(BeFalse);
			});
		}
		
	}
	
}