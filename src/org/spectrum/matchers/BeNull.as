package org.spectrum.matchers {
	
	import org.spectrum.core.Matcher;

	/**
	 * Matcher that determines if the given object is <code>null</code>.
	 */	
	public class BeNull extends Matcher {
		
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
		public function BeNull(actual:Object, expected:Object = null) {
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
			return actual == null || isNaN(actual as Number);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected ' + actual + (not ? ' to not be null' : ' to be null');
		}
		
	}
	
}