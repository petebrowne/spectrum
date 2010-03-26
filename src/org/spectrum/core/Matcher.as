package org.spectrum.core {
	
	import flash.events.EventDispatcher;
	
	import org.spectrum.events.MatcherEvent;
	
	/**
	 * An expression matcher that perform simple evaluations and comparisons of
	 * objects. They are used to validate Expectations.
	 */	
	public class Matcher extends EventDispatcher {
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		public var actual:Object;
		
		/**
		 * @private
		 */
		public var expected:Object;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor.
		 *  
		 * @param actual
		 * @param expected
		 */		
		public function Matcher(actual:Object, expected:Object = null) {
			this.actual   = actual;
			this.expected = expected;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Runs the evalutation and dispatches MatcherEvents that correspond to the
		 * results.
		 */				
		public function run():void {
			match() ? truthy() : falsey();
		}
		
		/**
		 * Performs the evaluation and returns true or false. Custom Matchers
		 * should override this method with custom evaluation logic.
		 * 
		 * @param actual
		 */		
		public function match():Boolean {
			throw new Error('This method should be implemented in a custom Matcher');
		}
		
		/**
		 * Returns a formatted string that describes the expectation and failure.
		 * 
		 * @param not
		 */		
		public function failureMessage(not:Boolean):String {
			throw new Error('This method should be implemented in a custom Matcher');
		}
		
		//--------------------------------------------------------------------------
		//
		//  Internal Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected function truthy():void {
			dispatchEvent(new MatcherEvent(MatcherEvent.TRUE));
		}
		
		/**
		 * @private
		 */
		protected function falsey():void {
			dispatchEvent(new MatcherEvent(MatcherEvent.FALSE));
		}

	}
	
}