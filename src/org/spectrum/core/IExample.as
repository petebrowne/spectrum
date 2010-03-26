package org.spectrum.core {
	
	import flash.events.IEventDispatcher;
	
	/**
	 * Interface for an Example of code expectations that can be run by
	 * Specs and Spec Suites.
	 */	
	public interface IExample extends IEventDispatcher {
		
		/**
		 * Runs this Example's code expectations.
		 */
		function run():void;
		
		/**
		 * The description of this Example's expectations or context.
		 */
		function get description():String;
		function set description(value:String):void;
		
		/**
		 * The ExampleGroup this Example belongs to. 
		 */
		function get group():ExampleGroup;
		function set group(value:ExampleGroup):void;
		
	}
	
}