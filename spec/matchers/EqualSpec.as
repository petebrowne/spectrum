package matchers {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class EqualSpec extends Spec {
		
		public function EqualSpec() {
			describe('with numbers', function():void {
				describe('that are equal', function():void {
					it('should match', function():void {
						expect(new Equal(1, 1).match()).to(BeTrue);
					});
					
					describe('but are different types', function():void {
						it('should match', function():void {
							expect(new Equal(1.0, 1).match()).to(BeTrue);
						});
					});
				});
				
				describe('that are not equal', function():void {
					it('should not match', function():void {
						expect(new Equal(1, 2).match()).to(BeFalse);
					});
				});
			});
			
			describe('with strings', function():void {
				describe('that are equal', function():void {
					it('should match', function():void {
						expect(new Equal('hello', 'hello').match()).to(BeTrue);
					});
				});
				
				describe('that are not equal', function():void {
					it('should not match', function():void {
						expect(new Equal('hello', 'world').match()).to(BeFalse);
					});
				});
			});
			
			describe('with arrays', function():void {
				describe('containing the same items', function():void {
					it('should match', function():void {
						expect(new Equal([ 1, 2, 3 ], [ 1, 2, 3 ]).match()).to(BeTrue);
					});
				});
				
				describe('containing different items', function():void {
					it('should not match', function():void {
						expect(new Equal([ 1, 2, 3 ], [ 2, 3, 4 ]).match()).to(BeFalse);
					});
				});
			});
		}
		
	}
	
}