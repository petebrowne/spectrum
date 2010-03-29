package {
	
	import core.*;
	
	import flash.display.Sprite;
	
	import matchers.*;
	
	import org.spectrum.Suite;
	import org.spectrum.reporters.TraceReporter;

	public class SpectrumSpecs extends Sprite {
		
		protected var runner:Suite;
		
		public function SpectrumSpecs() {
			runner = new Suite();
			runner.reporter = new TraceReporter({
				characterLimit : 85
			});
			runner.addSpecs(
				MatcherSpec,
				BeSpec,
				BeASpec,
				BeAnSpec,
				BeEmptySpec,
				BeFalseSpec,
				BeNullSpec,
				BeTrueSpec,
				DispatchSpec,
				EqualSpec,
				MatchSpec,
				ThrowSpec,
				ExpectationSpec,
				ExampleSpec,
				ExampleGroupSpec,
				SpecSpec
			);
			runner.run();
		}
		
	}
	
}