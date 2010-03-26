package core {
	
	import org.spectrum.Spec;
	import org.spectrum.core.Expectation;
	import org.spectrum.events.ExpectationEvent;
	import org.spectrum.matchers.*;

	public class ExpectationSpec extends Spec {
		
		public function ExpectationSpec() {
			describe('#run', function():void {
				describe('without a Matcher', function():void {
					it('should throw an Error', function():void {
						expect(function():void {
							new Expectation(null).run();
						}).to(Throw, Error);
					});
				});
			});
			
			describe('#to', function():void {
				it('should create a Matcher of the given type', function():void {
					var matcher:Object = new Expectation(null).to(BeNull);
					expect(matcher).to(BeA, BeNull);
				});
				
				describe('run with a truthy Matcher', function():void {
					it('should dispatch a PASSED event', function():void {
						var expectation:Expectation = new Expectation(null);
						expect(expectation).to(Dispatch, ExpectationEvent.PASSED).during(function():void {
							expectation.to(BeNull);
							expectation.run();
						});
					});
				});
				
				describe('run with a falsey Matcher', function():void {
					it('should dispatch a FAILED event', function():void {
						var expectation:Expectation = new Expectation('');
						expect(expectation).to(Dispatch, ExpectationEvent.FAILED).during(function():void {
							expectation.to(BeNull);
							expectation.run();
						});
					});
				});
			});
			describe('#toNot', function():void {
				it('should create a Matcher of the given type', function():void {
					var matcher:Object = new Expectation(null).toNot(BeNull);
					expect(matcher).to(BeA, BeNull);
				});
				
				describe('run with a truthy Matcher', function():void {
					it('should dispatch a FAILED event', function():void {
						var expectation:Expectation = new Expectation(null);
						expect(expectation).to(Dispatch, ExpectationEvent.FAILED).during(function():void {
							expectation.toNot(BeNull);
							expectation.run();
						});
					});
				});
				
				describe('run with a falsey Matcher', function():void {
					it('should dispatch a PASSED event', function():void {
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