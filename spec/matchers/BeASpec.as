package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeASpec extends Spec {
		
		public function BeASpec() {
			it('should match instances of the given class', function():void {
				expect(new BeA('', String).match()).to(BeTrue);
			});

			it('should not match instances of a different class', function():void {
				expect(new BeA([], String).match()).to(BeFalse);
			});
		}
		
	}
	
}