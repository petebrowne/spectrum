package {
	
	import org.spectrum.Spec;
	import org.spectrum.matchers.*;

	public class SpecSpec extends Spec {
		
		public function SpecSpec() {
			should('be on the stage', function():void {
				expect(stage).toNot(BeNull);
			});
			
			describe('#describe', function():void {
				var beforeInvoked:Boolean = false;
				var afterInvoked:Boolean  = false;
				
				before(function():void {
					beforeInvoked = true;
				});
				
				should('invoke #before before #it', function():void {
					expect(beforeInvoked).to(BeTrue);
					beforeInvoked = false;
				});
				
				should('invoke #before before each #it', function():void {
					expect(beforeInvoked).to(BeTrue);
				});
				
				should('invoke #after after #it', function():void {
					expect(afterInvoked).to(BeTrue);
					afterInvoked = false;
				});
				
				should('invoke #after after each #it', function():void {
					expect(afterInvoked).to(BeTrue);
				});
				
				after(function():void {
					afterInvoked = true;
				});
			});
			
			describe('#it', function():void {
				context('with Errors', function():void {
					should('still invoke #after', function():void {
						var spec:Spec = new Spec;
						var afterInvoked:Boolean = false;
						spec.after(function():void {
							afterInvoked = true;
						});
						spec.it('will fail', function():void {
							throw new Error();
						});
						Helper.runExamples(spec.run);
						expect(afterInvoked).to(BeTrue);
					});
				});
			});
		}
		
	}
	
}