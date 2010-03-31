package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeAnSpec extends Spec {
		
		public function BeAnSpec() {
			should('match instances of the given class', function():void {
				expect(new BeAn([], Array).match()).to(BeTrue);
			});
			
			should('not match instances of a different class', function():void {
				expect(new BeAn('', Array).match()).to(BeFalse);
			});
		}
		
	}
	
}