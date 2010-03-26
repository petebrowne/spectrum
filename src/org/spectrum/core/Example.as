package org.spectrum.core {
	
	import flash.events.EventDispatcher;
	
	import org.spectrum.events.ExampleEvent;
	import org.spectrum.events.ExpectationEvent;
	
	/**
	 * An example of how a bit of code is expected to behave.
	 */	
	public class Example extends EventDispatcher implements IExample {
		
		//--------------------------------------------------------------------------
		//
		//  Class Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The currently running Example.
		 */		
		static public var current:Example;
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Example's test implementation. This block will be called when the
		 * Example is run. 
		 */		
		public var implementation:Function;
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 * 
		 * The Expectations added to this Example.
		 */		
		protected var expectations:Array;
		
		/**
		 * @private
		 * 
		 * The number of Expectations that passed when this Example was run.
		 */	
		protected var passedCount:int;
		
		/**
		 * @private
		 * 
		 * Whether or not the result from this Example has been reported (dispatched).
		 */
		protected var reported:Boolean;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor.
		 *  
		 * @param description
		 * @param implementation
		 */		
		public function Example(description:String, implementation:Function = null) {
			this.description    = description;
			this.implementation = implementation;
			this.expectations	= [];
		}
		
		//--------------------------------------------------------------------------
		//
		//  Method
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */		
		public function run():void {
			current = this;
			dispatchEvent(new ExampleEvent(ExampleEvent.BEFORE, this));
			
			reported    = false;
			passedCount = 0;
			
			try {
				if (implementation != null) {
					implementation.call();
				}
	
				if (expectations.length == 0) {
					pending();
				}
				else {
					for each (var expectation:Expectation in expectations) {
						expectation.run();
					}
				}
			}
			catch (error:Error) {
				fail(error.message);
			}
			finally {
				dispatchEvent(new ExampleEvent(ExampleEvent.AFTER, this));
				current = null;
			}
		}
		
		/**
		 * Add an Expectation to this Example.
		 */		
		public function addExpectation(expectation:Expectation):void {
			expectation.addEventListener(ExpectationEvent.PASSED, handleExpectationPassed);
			expectation.addEventListener(ExpectationEvent.FAILED, handleExpectationFailed);
			expectations.push(expectation);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected function handleExpectationPassed(event:ExpectationEvent):void {
			passedCount++;
			if (passedCount == expectations.length) {
				pass();
			}
		}
		
		/**
		 * @private
		 */
		protected function handleExpectationFailed(event:ExpectationEvent):void {
			fail(event.message);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Property Methods
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  description
		//----------------------------------
		
		/**
		 * @private
		 */
		protected var _description:String;
		
		/**
		 * @inheritDoc
		 */	
		public function get description():String {
			return _description;
		}
		
		public function set description(value:String):void {
			_description = value;
		}
		
		//----------------------------------
		//  group
		//----------------------------------
		
		/**
		 * @private
		 */
		protected var _group:ExampleGroup;
		
		/**
		 * @inheritDoc
		 */	
		public function get group():ExampleGroup {
			return _group;
		}
		
		public function set group(value:ExampleGroup):void {
			_group = value;
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
			report(ExampleEvent.PASSED);
		}
		
		/**
		 * @private
		 */
		protected function fail(message:String):void {
			report(ExampleEvent.FAILED, message);
		}
		
		/**
		 * @private
		 */
		protected function pending():void {
			report(ExampleEvent.PENDING);
		}
		
		/**
		 * @private
		 * 
		 * Dispatches an ExampleEvent exactly one time while running the Example.
		 */
		protected function report(result:String, message:String = null):void {
			if (!reported) {
				dispatchEvent(new ExampleEvent(result, this, message));
			}
			reported = true;
		}

	}
	
}