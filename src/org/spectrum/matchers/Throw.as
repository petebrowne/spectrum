package org.spectrum.matchers {
	
	import org.spectrum.core.Matcher;

	/**
	 * Matcher that determines if the given code will throw the given error
	 * while being executed
	 */	
	public class Throw extends Matcher {
		
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
		public function Throw(actual:Object, expected:Object = null) {
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
			try {
				(actual as Function).call();
				return false;
			}
			catch (error:Error) {
				return (error is (expected as Class));
			}
			return false;
		}
		
		/**
		 * @see Matcher#failureMessage
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected function' + (not ? ' to not throw ' : ' to throw ') + expected;
		}
		
	}
	
}