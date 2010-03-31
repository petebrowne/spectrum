package {
	
	import core.*;
	
	import flash.display.Sprite;
	
	import matchers.*;
	
	import org.spectrum.Suite;
	import org.spectrum.reporters.TraceReporter;

	public class SpectrumSpecs extends Sprite {
		
		protected var suite:Suite;
		
		public function SpectrumSpecs() {
			suite = new Suite();
			suite.reporter = new TraceReporter({
				characterLimit : 85
			});
			suite.addSpecs(
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
			suite.run();
		}
		
	}
	
}