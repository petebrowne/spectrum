package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class EqualSpec extends Spec {
		
		public function EqualSpec() {
			context('with numbers', function():void {
				context('that are equal', function():void {
					should('match', function():void {
						expect(new Equal(1, 1).match()).to(BeTrue);
					});
					
					context('but are different types', function():void {
						should('match', function():void {
							expect(new Equal(1.0, 1).match()).to(BeTrue);
						});
					});
				});
				
				context('that are not equal', function():void {
					should('not match', function():void {
						expect(new Equal(1, 2).match()).to(BeFalse);
					});
				});
			});
			
			context('with strings', function():void {
				context('that are equal', function():void {
					should('match', function():void {
						expect(new Equal('hello', 'hello').match()).to(BeTrue);
					});
				});
				
				context('that are not equal', function():void {
					should('not match', function():void {
						expect(new Equal('hello', 'world').match()).to(BeFalse);
					});
				});
			});
			
			context('with arrays', function():void {
				context('containing the same items', function():void {
					should('match', function():void {
						expect(new Equal([ 1, 2, 3 ], [ 1, 2, 3 ]).match()).to(BeTrue);
					});
				});
				
				context('containing different items', function():void {
					should('not match', function():void {
						expect(new Equal([ 1, 2, 3 ], [ 2, 3, 4 ]).match()).to(BeFalse);
					});
				});
			});
		}
		
	}
	
}