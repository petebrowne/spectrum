package org.spectrum.events {
	
	import flash.events.Event;
	
	import org.spectrum.core.Expectation;
	
	/**
	 * ExpectationEvent are dispatched when Expectations are run and hold the results
	 * of the Expectations.
	 */	
	public class ExpectationEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Event Constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Event constant for when an Expectation passes.
		 */		
		static public const PASSED:String = 'passed';
		
		/**
		 * Event constant for when an Expectation fails.
		 */		
		static public const FAILED:String = 'failed';
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The original Expectation this Event was reported from.
		 */	
		public var expectation:Expectation;
		
		/**
		 * If the Expectation fails, this will be set to the failure message.
		 */		
		public var message:String;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor
		 *  
		 * @param type
		 * @param expectation
		 * @param message;
		 */		
		public function ExpectationEvent(type:String, expectation:Expectation, message:String = null) {
			super(type);
			
			this.expectation = expectation;
			this.message     = message;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		override public function clone():Event {
			return new ExpectationEvent(type, expectation, message);
		}
		
	}
	
}