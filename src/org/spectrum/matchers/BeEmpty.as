package org.spectrum.matchers {
	
	import org.spectrum.core.Matcher;

	/**
	 * Matcher that determines if the given object is empty.
	 */	
	public class BeEmpty extends Matcher {
		
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
		public function BeEmpty(actual:Object, expected:Object = null) {
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
			if (actual is String) {
				return !actual.match(/\S/);
			}
			return actual.length == 0;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected ' + actual + (not ? ' to not be empty' : ' to be empty');
		}
		
	}
	
}