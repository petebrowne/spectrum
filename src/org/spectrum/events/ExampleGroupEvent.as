package org.spectrum.events {
	
	import flash.events.Event;
	
	import org.spectrum.core.ExampleGroup;

	/**
	 * ExampleGroupEvents are dispatched before and after an ExampleGroup is run.
	 */	
	public class ExampleGroupEvent extends Event {
		
		//--------------------------------------------------------------------------
		//
		//  Event Constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Event constant for when an ExampleGroup has finished.
		 */		
		static public const START:String = 'start';
		
		/**
		 * Event constant for when an ExampleGroup has started.
		 */		
		static public const FINISH:String = 'finish';
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The original ExampleGroup this Event was reported from.
		 */		
		public var group:ExampleGroup;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor
		 *  
		 * @param type
		 * @param group
		 */		
		public function ExampleGroupEvent(type:String, group:ExampleGroup = null) {
			super(type);
			
			this.group = group;
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
			return new ExampleGroupEvent(type, group);
		}
		
	}
}