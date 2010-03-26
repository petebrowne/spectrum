package org.spectrum.core {
	
	import flash.events.EventDispatcher;
	
	import org.spectrum.events.ExpectationEvent;
	import org.spectrum.events.MatcherEvent;
	
	/**
	 * An Expectation is a way of setting expectations on your objects.
	 */	
	public class Expectation extends EventDispatcher {
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected var actual:Object;
		
		/**
		 * @private
		 */
		protected var matcher:Matcher;
		
		/**
		 * @private 
		 */	
		protected var not:Boolean;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor
		 *  
		 * @param target
		 */		
		public function Expectation(actual:Object) {
			this.actual = actual;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Runs the Expectation, which in turn runs whichever Matcher is necessary
		 * and reports the results.
		 */		
		public function run():void {
			if (matcher) {
				matcher.run();
			}
			else {
				throw new Error('Every Expectation should include a Matcher');
			}
		}
		
		/**
		 * The given Matcher is evaluated with an expected result of <code>true</code>.
		 * 
		 * @param matcherType
		 * @param expected
		 * @return
		 */		
		public function to(matcherType:Class, expected:Object = null):Object {
			matcher = new matcherType(actual, expected) as Matcher;
			matcher.addEventListener(MatcherEvent.TRUE, handleMatcherTrue);
			matcher.addEventListener(MatcherEvent.FALSE, handleMatcherFalse);
			return matcher;
		}
		
		/**
		 * The given Matcher is evaluated with an expected result of <code>false</code>.
		 * 
		 * @param matcherType
		 * @param expected
		 * @return
		 */		
		public function toNot(matcherType:Class, expected:Object = null):Object {
			not = true;
			return to(matcherType, expected);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected function handleMatcherTrue(event:MatcherEvent):void {
			not ? fail(matcher.failureMessage(not)) : pass();
		}
		
		/**
		 * @private 
		 */	
		protected function handleMatcherFalse(event:MatcherEvent):void {
			not ? pass() : fail(matcher.failureMessage(not));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Internal Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private 
		 */	
		protected function pass():void {
			dispatchEvent(new ExpectationEvent(ExpectationEvent.PASSED, this));
		}
		
		/**
		 * @private
		 */
		protected function fail(message:String):void {
			dispatchEvent(new ExpectationEvent(ExpectationEvent.FAILED, this, message));
		}

	}
	
}