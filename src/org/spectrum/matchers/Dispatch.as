package org.spectrum.matchers {
	
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	import org.spectrum.core.Matcher;
	import org.spectrum.events.MatcherEvent;

	/**
	 * Matcher that determines if the given code will execute without throwing
	 * the given error.
	 */	
	public class Dispatch extends Matcher {
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private 
		 */	
		protected var duringBlock:Function;
		
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
		public function Dispatch(actual:Object, expected:Object = null) {
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
		override public function run():void {
			if (duringBlock == null) {
				throw new Error('A during block must be added to the Dispatch Matcher');
			}
			
			var dispatched:Boolean = false;
			(actual as IEventDispatcher).addEventListener(expected as String, function(event:Event):void {
				dispatched = true;
			});
			duringBlock.call();
			dispatched ? truthy() : falsey();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * 
		 *  
		 * @param block
		 * @return
		 */		
		public function during(block:Function):Object {
			duringBlock = block;
			return this;
		}
		
		/**
		 * @see Matcher#failureMessage
		 */
		override public function failureMessage(not:Boolean):String {
			return 'expected ' + actual + (not ? ' to not dispatch ' : ' to dispatch ') + expected;
		}
		
	}
	
}