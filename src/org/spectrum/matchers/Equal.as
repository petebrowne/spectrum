package org.spectrum.matchers {
	
	import org.spectrum.core.Matcher;

	/**
	 * Matcher that determines if the given object equals the expected object (==). In
	 * the case of Array comparison, they only need to contain the same objects.
	 */	
	public class Equal extends Matcher {
		
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
		public function Equal(actual:Object, expected:Object = null) {
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
			return equal(expected, actual);
		}
		
		/**
		 * @inheritDoc
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected ' + actual + (not ? ' to not equal ' : ' to equal ') + expected;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Internal Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected function equal(a:*, b:*):Boolean {
			if (a is Array) {
				return equalArrays(a, b);
			}
			return a == b;
		}
		
		/**
		 * @private
		 */
		protected function equalArrays(a:Array, b:Array):Boolean {
			var length:int = a.length;
			if (b.length != length) {
				return false;
			}
			for (var i:int = 0; i < length; i++) {
				if (!equal(a[i], b[i])) {
					return false;
				}
			}
			return true;
		}
		
	}
	
}