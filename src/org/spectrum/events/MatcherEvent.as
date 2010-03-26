package org.spectrum.events {
	
	import flash.events.Event;
	
	/**
	 * MatcherEvents are dispatched when Matchers are run and hold the results
	 * of the Matchers.
	 */	
	public class MatcherEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Event Constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Event constant for when an Matcher is true.
		 */		
		static public const TRUE:String = 'true';
		
		/**
		 * Event constant for when an Matcher is false.
		 */		
		static public const FALSE:String = 'false';
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor
		 *  
		 * @param type
		 */		
		public function MatcherEvent(type:String) {
			super(type);
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
			return new MatcherEvent(type);
		}
		
	}
	
}