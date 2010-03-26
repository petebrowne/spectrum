package org.spectrum {
	
	import flash.events.Event;
	
	import org.spectrum.core.Example;
	import org.spectrum.core.ExampleGroup;
	import org.spectrum.core.Expectation;
	import org.spectrum.events.ExampleEvent;
	
	/**
	 * Spec is where you write your tests. Generally you create subclasses
	 * of Spec for each class you are testing.
	 */
	public class Spec extends ExampleGroup {
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected var currentGroup:ExampleGroup;
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor.
		 * 
		 * @param description
		 */		
		public function Spec(description:String = null) {
			super(description || this);

			this.currentGroup = this;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Describes a group of examples of a particular behavior.
		 *  
		 * @param description
		 * @param block
		 */		
		public function describe(description:Object, block:Function):void {
			var prevGroup:ExampleGroup = currentGroup;
			currentGroup = new ExampleGroup(description);
			prevGroup.addExample(currentGroup);
			block.call();
			currentGroup = prevGroup;
		}
		
		/**
		 * Creates an example of a particular behavior.
		 *  
		 * @param description
		 * @param block
		 */		
		public function it(description:String, block:Function = null):void {
			if (currentGroup) {
				currentGroup.addExample(new Example(description, block));
			}
		}
		
		/**
		 * Defines code that executes before each example.
		 *  
		 * @param block
		 */		
		public function before(block:Function):void {
			if (currentGroup) {
				currentGroup.addEventListener(ExampleEvent.BEFORE, function(event:Event):void {
					block.call();
				});
			}
		}
		
		/**
		 * Defines code that executes after each example.
		 *  
		 * @param block
		 */		
		public function after(block:Function):void {
			if (currentGroup) {
				currentGroup.addEventListener(ExampleEvent.AFTER, function(event:Event):void {
					block.call();
				});
			}
		}
		
		/**
		 * Defines an expectation of your code. This is the actual "Test".
		 *  
		 * @param actual
		 * @return 
		 */		
		public function expect(actual:Object):Expectation {
			if (!Example.current) {
				throw new Error('Expectations must be declared within "it" blocks');
			}
			
			var expectation:Expectation = new Expectation(actual);
			Example.current.addExpectation(expectation);
			return expectation;
		}
		
	}
	
}