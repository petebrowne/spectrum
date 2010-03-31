package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class ThrowSpec extends Spec {
		
		public function ThrowSpec() {
			should('match if the given error is thrown', function():void {
				expect(
					new Throw(function():void {
						throw new ArgumentError('ARG!');
					}, ArgumentError).match()
				).to(BeTrue);
			});
			
			should('not match if the given error is not thrown', function():void {
				expect(
					new Throw(function():void {
						// do nothing
					}, ArgumentError).match()
				).to(BeFalse);
			});
		}
		
	}
	
}