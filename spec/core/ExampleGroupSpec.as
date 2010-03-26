package core {
	
	import flash.display.Sprite;
	
	import org.spectrum.Spec;
	import org.spectrum.core.Example;
	import org.spectrum.core.ExampleGroup;
	import org.spectrum.core.Expectation;
	import org.spectrum.events.ExampleEvent;
	import org.spectrum.matchers.*;

	public class ExampleGroupSpec extends Spec {
		protected var exampleGroup:ExampleGroup;
		
		public function ExampleGroupSpec() {
			describe('generating descriptions', function():void {
				describe('with a string', function():void {
					it('should use the string', function():void {
						expect(new ExampleGroup('description').description).to(Equal, 'description');
					});
				});
				
				describe('with a Class', function():void {
					it('should use the class name', function():void {
						expect(new ExampleGroup(Sprite).description).to(Equal, 'Sprite');
					});
				});
				
				describe('with an object instance', function():void {
					it('should use the class name', function():void {
						expect(new ExampleGroup(new Sprite()).description).to(Equal, 'Sprite');
					});
				});
				
				describe('with a Spec', function():void {
					it('should remove "Spec" from the name', function():void {
						expect(new ExampleGroup(ExampleGroupSpec).description).to(Equal, 'ExampleGroup');
					})
				});
			});
			
			describe('adding Examples', function():void {
				it('should increase the examples count', function():void {
					exampleGroup = new ExampleGroup();
					expect(exampleGroup.examplesCount).to(Equal, 0);
					exampleGroup.addExample(new Example(''));
					expect(exampleGroup.examplesCount).to(Equal, 1);
				});
			});
			
			describe('adding other ExampleGroups', function():void {
				it('should increase the examples count', function():void {
					var otherGroup:ExampleGroup = new ExampleGroup();
					otherGroup.addExample(new Example(''));
					exampleGroup = new ExampleGroup();
					expect(exampleGroup.examplesCount).to(Equal, 0);
					exampleGroup.addExample(otherGroup);
					expect(exampleGroup.examplesCount).to(Equal, 1);
				});
			});
			
			describe('#run', function():void {
				before(function():void {
					exampleGroup = new ExampleGroup();
				});
				
				it('should run each Example', function():void {
					var count:int = 0;
					for (var i:int = 0; i < 5; i++) {
						exampleGroup.addExample(new Example('', function():void {
							count++;
						}));
					}
					SpecHelper.runExamples(exampleGroup.run);
					expect(count).to(Equal, 5);
				});
				
				it('should run each ExampleGroup', function():void {
					var count:int = 0;
					for (var i:int = 0; i < 5; i++) {
						var otherGroup:ExampleGroup = new ExampleGroup();
						otherGroup.addExample(new Example('', function():void {
							count++;
						}));
						exampleGroup.addExample(otherGroup);
					}
					SpecHelper.runExamples(exampleGroup.run);
					expect(count).to(Equal, 5);
				});
				
				describe('with a failing Example', function():void {
					it('should dispatch a FAILED event', function():void {
						var example:Example = new Example('');
						var expectation:Expectation = new Expectation(false);
						expectation.to(BeTrue);
						example.addExpectation(expectation);
						exampleGroup.addExample(example);
						
						expect(exampleGroup)
							.to(Dispatch, ExampleEvent.FAILED)
							.during(function():void {
								SpecHelper.runExamples(exampleGroup.run);
							});
					});
				});
				
				describe('with a passing Example', function():void {
					it('should dispatch a PASSED event', function():void {
						var example:Example = new Example('');
						var expectation:Expectation = new Expectation(true);
						expectation.to(BeTrue);
						example.addExpectation(expectation);
						exampleGroup.addExample(example);
						
						expect(exampleGroup)
							.to(Dispatch, ExampleEvent.PASSED)
							.during(function():void {
								SpecHelper.runExamples(exampleGroup.run);
							});
					});
				});
				
				describe('with a pending Example', function():void {
					it('should dispatch a PENDING event', function():void {
						var example:Example = new Example('');
						exampleGroup.addExample(example);
						
						expect(exampleGroup)
							.to(Dispatch, ExampleEvent.PENDING)
							.during(function():void {
								SpecHelper.runExamples(exampleGroup.run);
							});
					});
				});
			});
		}
		
	}
	
}