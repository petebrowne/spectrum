package org.spectrum.matchers {
	
	import org.spectrum.core.Matcher;

	/**
	 * Matcher that determines if the given object strictly equals the expected 
	 * object (===);
	 */	
	public class Be extends Matcher {
		
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
		public function Be(actual:Object, expected:Object = null) {
			super(actual, expected);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */		
		override public function match():Boolean {
			return actual === expected;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected ' + actual + (not ? ' to not be ' : ' to be ') + expected;
		}
		
	}
	
}