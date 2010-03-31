package core {
	
	import org.spectrum.Spec;
	import org.spectrum.core.Expectation;
	import org.spectrum.events.ExpectationEvent;
	import org.spectrum.matchers.*;

	public class ExpectationSpec extends Spec {
		
		public function ExpectationSpec() {
			describe('#run', function():void {
				context('without a Matcher', function():void {
					should('throw an Error', function():void {
						expect(function():void {
							new Expectation(null).run();
						}).to(Throw, Error);
					});
				});
			});
			
			describe('#to', function():void {
				should('create a Matcher of the given type', function():void {
					var matcher:Object = new Expectation(null).to(BeNull);
					expect(matcher).to(BeA, BeNull);
				});
				
				context('with a truthy Matcher', function():void {
					should('dispatch a PASSED event', function():void {
						var expectation:Expectation = new Expectation(null);
						expect(expectation).to(Dispatch, ExpectationEvent.PASSED).during(function():void {
							expectation.to(BeNull);
							expectation.run();
						});
					});
				});
				
				context('with a falsey Matcher', function():void {
					should('dispatch a FAILED event', function():void {
						var expectation:Expectation = new Expectation('');
						expect(expectation).to(Dispatch, ExpectationEvent.FAILED).during(function():void {
							expectation.to(BeNull);
							expectation.run();
						});
					});
				});
			});
			describe('#toNot', function():void {
				should('create a Matcher of the given type', function():void {
					var matcher:Object = new Expectation(null).toNot(BeNull);
					expect(matcher).to(BeA, BeNull);
				});
				
				context('with a truthy Matcher', function():void {
					should('dispatch a FAILED event', function():void {
						var expectation:Expectation = new Expectation(null);
						expect(expectation).to(Dispatch, ExpectationEvent.FAILED).during(function():void {
							expectation.toNot(BeNull);
							expectation.run();
						});
					});
				});
				
				context('with a falsey Matcher', function():void {
					should('dispatch a PASSED event', function():void {
						var expectation:Expectation = new Expectation('');
						expect(expectation).to(Dispatch, ExpectationEvent.PASSED).during(function():void {
							expectation.toNot(BeNull);
							expectation.run();
						});
					});
				});
			});
		}
		
	}
	
}