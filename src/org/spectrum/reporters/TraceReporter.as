package org.spectrum.reporters {
	
	import org.spectrum.core.IExample;
	import org.spectrum.core.IReporter;
	
	/**
	 * ResultsViewer for Tracing the results of the tests.
	 */	
	public class TraceReporter implements IReporter {
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Whether or not to output color for terminal.
		 */		
		public var terminal:Boolean = false;
		
		/**
		 * The target right edge of output.
		 */
		public var characterLimit:int = 80;
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected var examplesCount:int;
		
		/**
		 * @private
		 */
		protected var passedCount:int;
		
		/**
		 * @private
		 */
		protected var failedCount:int;
		
		/**
		 * @private
		 */
		protected var pendingCount:int;
		
		/**
		 * @private
		 */
		protected var specReports:Array;
		
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
		public function TraceReporter(settings:Object = null) {
			if (settings != null) {
				for (var property : Object in settings) {
					this[property] = settings[property];
				}
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @see spectrum.core.IReporter#start
		 */		
		public function start(examples:int):void {
			examplesCount = examples;
			passedCount   = 0;
			failedCount   = 0;
			pendingCount  = 0;
			specReports   = [];
		}
		
		/**
		 * @see spectrum.core.IReporter#passed
		 */	
		public function passed(example:IExample):void {
			addResult(example, '');
			passedCount++;
			checkFinished();
		}
		
		/**
		 * @see spectrum.core.IReporter#failed
		 */	
		public function failed(example:IExample, message:String):void {
			addResult(example, 'FAILED', message);
			failedCount++;
			checkFinished();
		}
		
		/**
		 * @see spectrum.core.IReporter#pending
		 */		
		public function pending(example:IExample):void {
			addResult(example, 'PENDING');
			pendingCount++;
			checkFinished();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Internal Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected function checkFinished():void {
			if (passedCount + failedCount + pendingCount == examplesCount) {
				finish();
			}
		}
		
		/**
		 * @private
		 */		
		protected function finish():void {
			var line:String = '';
			for (var i:int = 0; i < characterLimit; i++) {
				line += '-';
			}
			
			trace('');
			trace(line);
			for each (var specReport:SpecReport in specReports) {
				trace('');
				trace('  ' + specReport.name);
				for each (var result:String in specReport.results) {
					trace(result);
				}
			}
			trace('');
			trace(line);
			trace('  Passed   ' + passedCount);
			trace('  Failed   ' + failedCount);
			trace('  Pending  ' + pendingCount);
			trace(line);
			trace('');
		}
		
		/**
		 * @private
		 */		
		protected function addResult(example:IExample, result:String, message:String = null):void {
			result = rightJustify(getFullDescription(example), result);
			if (message) {
				result += '\n      ' + message;
			}
			getSpecReport(example).results.push(result);
		}
		
		/**
		 * @private
		 */
		protected function getFullDescription(example:IExample):String {
			if (getLevel(example) <= 2) {
				return example.description;
			}
			return getFullDescription(example.group) + ' ' + example.description;
		}
		
		/**
		 * @private
		 */
		protected function getSpecName(example:IExample):String {
			if (getLevel(example) <= 1) {
				return example.description;
			}
			return getSpecName(example.group);
		}
		
		/**
		 * @private
		 */
		protected function getLevel(example:IExample):int {
			if (example.group) {
				return getLevel(example.group) + 1;
			}
			return 0;
		}
		
		/**
		 * @private
		 */
		protected function getSpecReport(example:IExample):SpecReport {
			var name:String = getSpecName(example);
			return findSpecReport(name) || createSpecReport(name);
		}
		
		/**
		 * @private
		 */		
		protected function findSpecReport(name:String):SpecReport {
			for each (var specReport:SpecReport in specReports) {
				if (specReport.name == name) {
					return specReport;
				}
			}
			return null;
		}
		
		/**
		 * @private
		 */
		protected function createSpecReport(name:String):SpecReport {
			var specReport:SpecReport = new SpecReport(name);
			specReports.push(specReport);
			return specReport;
		}
		
		/**
		 * @private
		 */
		protected function rightJustify(description:String, result:String):String {
			var text:String   = '    ' + description;
			if (result == '') {
				return text;
			}
			text  += ' ';
			result = ' ' + result;
			while (text.length < (characterLimit - result.length)) {
				text += '.';
			}
			return text + result;
		}

	}
	
}

/**
 * @private
 */
class SpecReport {
	
	public var name:String;
	public var results:Array;
	
	public function SpecReport(name:String) {
		this.name    = name;
		this.results = [];
	}
}