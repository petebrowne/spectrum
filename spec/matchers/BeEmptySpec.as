package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class BeEmptySpec extends Spec {
		
		public function BeEmptySpec() {
			it('should match empty arrays', function():void {
				expect(new BeEmpty([]).match()).to(BeTrue);
			});

			it('should not match arrays with items', function():void {
				expect(new BeEmpty([ 1 ]).match()).to(BeFalse);
			});

			it('should match strings with no characters', function():void {
				expect(new BeEmpty('').match()).to(BeTrue);
			});
			
			it('should match strings with only whitespace characters', function():void {
				expect(new BeEmpty(" \r\n").match()).to(BeTrue);
			});

			it('should not match strings with characters', function():void {
				expect(new BeEmpty('hello').match()).to(BeFalse);
			});
		}
		
	}
	
}