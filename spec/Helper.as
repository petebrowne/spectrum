package {
	
	import org.spectrum.core.Example;
	
	public class Helper {
		
		static public function runExamples(block:Function):void {
			var previousExample:Example = Example.current;
			block.call();
			Example.current = previousExample;
		}

	}
	
}