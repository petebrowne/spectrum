package org.spectrum.matchers {
	
	import org.spectrum.core.Matcher;

	/**
	 * Matcher that determines if the given object evaluates to <code>true</code>.
	 */	
	public class BeTrue extends Matcher {
		
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
		public function BeTrue(actual:Object, expected:Object = null) {
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
			return !!actual;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected ' + actual + (not ? ' to not be true' : ' to be true');
		}
		
	}
	
}