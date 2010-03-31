package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeNullSpec extends Spec {
		
		public function BeNullSpec() {
			should('match nulls', function():void {
				expect(new BeNull(null).match()).to(BeTrue);
			});
			
			should('match NaNs', function():void {
				expect(new BeNull(NaN).match()).to(BeTrue);
			});
			
			should('not match strings', function():void {
				expect(new BeNull('something').match()).to(BeFalse);
			});
			
			should('not match numbers', function():void {
				expect(new BeNull(5).match()).to(BeFalse);
			});
		}
		
	}
	
}