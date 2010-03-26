package org.spectrum {
	
	import org.spectrum.core.ExampleGroup;
	import org.spectrum.core.IReporter;
	import org.spectrum.events.ExampleEvent;
	import org.spectrum.reporters.TraceReporter;
	
	/**
	 * Suite is the entry point for testing code with Spectrum. Here you tell
	 * Spectrum the Specs you want to test and set any other configuration options.
	 */	
	public class Suite extends ExampleGroup {
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The reporter to use. Changing this will change the way the
		 * results of the tests are displayed. By default, TraceReporter is used,
		 * which simply traces the results.
		 */
		public var reporter:IReporter;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor
		 *  
		 * @param settings
		 */			
		public function Suite(settings:Object = null) {
			if (settings != null) {
				for (var property : Object in settings) {
					this[property] = settings[property];
				}
			}
			
			if (reporter == null) {
				reporter = new TraceReporter();
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Adds the Specs you want to test.
		 *  
		 * @param specs
		 * @return
		 */		
		public function addSpecs(...specs):void {
			for each (var spec:Class in specs) {
				addExample(new spec as ExampleGroup);
			}
		}
		
		/**
		 * Runs all the Specs and displays the results using whichever
		 * results viewer is selected.
		 */		
		override public function run():void {
			if (!reporter) {
				return;
			}

			reporter.start(examplesCount);
			super.run();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		override protected function handleExampleEvent(event:ExampleEvent):void {
			switch (event.type) {
				case ExampleEvent.PASSED:
					reporter.passed(event.example);
					break;
				case ExampleEvent.FAILED:
					reporter.failed(event.example, event.message);
					break;
				case ExampleEvent.PENDING:
					reporter.pending(event.example);
					break;
			}
		}
		
	}
	
}