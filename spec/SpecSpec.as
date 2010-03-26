package {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class SpecSpec extends Spec {
		
		public function SpecSpec() {
			describe('#describe', function():void {
				var beforeInvoked:Boolean = false;
				var afterInvoked:Boolean  = false;
				
				before(function():void {
					beforeInvoked = true;
				});
				
				it('invokes #before before #it', function():void {
					expect(beforeInvoked).to(BeTrue);
					beforeInvoked = false;
				});
				
				it('invokes #before before each #it', function():void {
					expect(beforeInvoked).to(BeTrue);
				});
				
				it('invokes #after after #it', function():void {
					expect(afterInvoked).to(BeTrue);
					afterInvoked = false;
				});
				
				it('invokes #after after each #it', function():void {
					expect(afterInvoked).to(BeTrue);
				});
				
				after(function():void {
					afterInvoked = true;
				});
			});
			
			describe('#it with Errors', function():void {
				it('should still invoke #after', function():void {
					var spec:Spec = new Spec;
					var afterInvoked:Boolean = false;
					spec.after(function():void {
						afterInvoked = true;
					});
					spec.it('will fail', function():void {
						throw new Error();
					});
					SpecHelper.runExamples(spec.run);
					expect(afterInvoked).to(BeTrue);
				});
			});
		}
		
	}
	
}