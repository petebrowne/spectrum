package org.spectrum.core {
	
	/**
	 * Interface for implementing the view for examining the results
	 * of the Specs.
	 */	
	public interface IReporter {
		
		/**
		 * Called at the start of a new session of testing.
		 * 
		 * @param examples The number of Examples that will be evaluated.
		 */		
		function start(examples:int):void;
		
		/**
		 * Called when an Example passes.
		 * 
		 * @param example
		 */		
		function passed(example:IExample):void;
		
		/**
		 * Called when an Example fails.
		 *  
		 * @param example
		 * @param message
		 */		
		function failed(example:IExample, message:String):void;
		
		/**
		 * Called when an Example has not implemented any expectations.
		 *  
		 * @param example
		 */		
		function pending(example:IExample):void;
		
	}
	
}