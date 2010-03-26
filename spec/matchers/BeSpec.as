package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeSpec extends Spec {
		
		public function BeSpec() {
			it('should match equal numbers', function():void {
				expect(new Be(1, 1).match()).to(BeTrue);
			});
			
			it('should match equal strings', function():void {
				expect(new Be('hello', 'hello').match()).to(BeTrue);
			});
			
			it('should match the same array instance', function():void {
				var array:Array = [ 1, 2 ];
				expect(new Be(array, array).match()).to(BeTrue);
			});
			
			it('should not match arrays that are not the same instance', function():void {
				expect(new Be([ 1, 2 ], [ 1, 2 ]).match()).to(BeFalse);
			});
		}
		
	}
	
}