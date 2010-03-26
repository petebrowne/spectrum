package org.spectrum.events {
	
	import flash.events.Event;
	
	import org.spectrum.core.IExample;
	
	/**
	 * ExampleEvents are dispatched when Examples are run and hold the results
	 * of the Examples.
	 */	
	public class ExampleEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Event Constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Event constant for when an Example has passed.
		 */		
		static public const PASSED:String = 'passed';
		
		/**
		 * Event constant for when an Example has failed.
		 */		
		static public const FAILED:String = 'failed';
		
		/**
		 * Event constant for when an Example is pending.
		 */		
		static public const PENDING:String = 'pending';
		
		/**
		 * Event constant for before an Example or ExampleGroup is run.
		 */		
		static public const BEFORE:String = 'before';
		
		/**
		 * Event constant for after an Example or ExampleGroup is run.
		 */		
		static public const AFTER:String = 'after';
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The original Example this Event was reported from.
		 */	
		public var example:IExample;
		
		/**
		 * If the Example's expectations fail, this will be set to the failure
		 * message.
		 */		
		public var message:String;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor.
		 *  
		 * @param type
		 * @param example
		 * @param failureMessage
		 */		
		public function ExampleEvent(type:String, example:IExample, message:String = null) {
			super(type);
			
			this.example = example;
			this.message = message;
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
			return new ExampleEvent(type, example, message);
		}
		
	}
	
}