package core {
	
	import org.spectrum.Spec;
	import org.spectrum.core.Example;
	import org.spectrum.core.Expectation;
	import org.spectrum.events.ExampleEvent;
	import org.spectrum.matchers.*;

	public class ExampleSpec extends Spec {
		
		protected var example:Example;
		
		protected var expectation:Expectation;
		
		public function ExampleSpec() {
			describe('#run', function():void {
				should('run the given implementation', function():void {
					var implementationInvoked:Boolean = false;
					example = new Example('', function():void {
						implementationInvoked = true;
					})
					runCurrentExample();
					expect(implementationInvoked).to(BeTrue);
				});
				
				context('without an implementation', function():void {
					should('dispatch a PENDING event', function():void {
						example = new Example('');
						expect(example)
							.to(Dispatch, ExampleEvent.PENDING)
							.during(runCurrentExample);
					});
				});
				
				context('without any expectations', function():void {
					should('dispatch a PENDING event', function():void {
						example = new Example('', function():void {});
						expect(example)
							.to(Dispatch, ExampleEvent.PENDING)
							.during(runCurrentExample);
					});
				});
				
				context('with a passing expectation', function():void {
					should('dispatch a PASSED event', function():void {
						example = new Example('', function():void {});
						
						expectation = new Expectation(null);
						expectation.to(BeNull);
						example.addExpectation(expectation);
						
						expect(example)
							.to(Dispatch, ExampleEvent.PASSED)
							.during(runCurrentExample);
					});
				});
				
				context('with multiple passing expectations', function():void {
					should('dispatch a PASSED event', function():void {
						example = new Example('', function():void {});
						
						expectation = new Expectation(null);
						expectation.to(BeNull);
						example.addExpectation(expectation);
						
						expectation = new Expectation(true);
						expectation.to(BeTrue);
						example.addExpectation(expectation);
						
						expectation = new Expectation(false);
						expectation.toNot(BeTrue);
						example.addExpectation(expectation);
						
						expect(example)
							.to(Dispatch, ExampleEvent.PASSED)
							.during(runCurrentExample);
					});
				});
				
				context('with a failing expectation', function():void {
					should('dispatch a FAILED event', function():void {
						example = new Example('', function():void {});
						
						expectation = new Expectation(null);
						expectation.to(BeNull);
						example.addExpectation(expectation);
						
						expectation = new Expectation(true);
						expectation.to(BeTrue);
						example.addExpectation(expectation);
						
						expectation = new Expectation('');
						expectation.to(BeNull);
						example.addExpectation(expectation);
						
						expect(example)
							.to(Dispatch, ExampleEvent.FAILED)
							.during(runCurrentExample);
					});
				});
			});
		}
		
		protected function runCurrentExample():void {
			SpecHelper.runExamples(example.run);
		}
		
	}
	
}