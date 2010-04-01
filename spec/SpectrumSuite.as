package {
	
	import core.*;
	
	import flash.display.Sprite;
	
	import matchers.*;
	
	import org.spectrum.Suite;
	import org.spectrum.reporters.TraceReporter;

	public class SpectrumSuite extends Suite {
		
		public function SpectrumSuite() {
			addSpecs(
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
			run();
		}
		
	}
	
}