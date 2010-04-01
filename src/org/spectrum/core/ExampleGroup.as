package org.spectrum.core {
	
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;
	
	import org.spectrum.events.ExampleEvent;
	
	/**
	 * A group of Examples to test.
	 */	
	public class ExampleGroup extends Sprite implements IExample {
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */		
		protected var examples:Array;
		
		/**
		 * @private
		 */
		protected var exampleGroups:Array;
		
		//--------------------------------------------------------------------------
		//
		//  Contructor
		//
		//--------------------------------------------------------------------------
		
		/**
		 * The Constructor.
		 * 
		 * @param description
		 */		
		public function ExampleGroup(description:Object = null) {
			if (description is String) {
				this.description = description as String;
			}
			else if (description) {
				this.description = getQualifiedClassName(description)
					.replace(/^.*\:{2}/, '')
					.replace(/Spec$/, '');
			}
			
			this.examples      = [];
			this.exampleGroups = [];
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @inheritDoc
		 */		
		public function run():void {
			dispatchEvent(new ExampleEvent(ExampleEvent.BEFORE, this));
			for each (var example:IExample in examples) {
				example.run();
			}
			dispatchEvent(new ExampleEvent(ExampleEvent.AFTER, this));
		}
		
		/**
		 * Add an Example or ExampleGroup to test.
		 *  
		 * @param example
		 */		
		public function addExample(example:IExample):void {
			example.group = this;
			example.addEventListener(ExampleEvent.PASSED, handleExampleEvent);
			example.addEventListener(ExampleEvent.FAILED, handleExampleEvent);
			example.addEventListener(ExampleEvent.PENDING, handleExampleEvent);
			example.addEventListener(ExampleEvent.BEFORE, handleExampleEvent);
			example.addEventListener(ExampleEvent.AFTER, handleExampleEvent);
			examples.push(example);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event Handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 * 
		 * We dispatch any events dispatched by Examples up the ExampleGroup chain,
		 * so the final Suite hears every one of them.
		 */
		protected function handleExampleEvent(event:ExampleEvent):void {
			dispatchEvent(event);
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
		
		//----------------------------------
		//  examplesCount
		//----------------------------------
		
		/**
		 * The total number of Examples in this group.
		 */		
		public function get examplesCount():int {
			var count:int = 0;
			for each (var example:IExample in examples) {
				if (example is ExampleGroup) {
					count += (example as ExampleGroup).examplesCount;
				}
				else {
					count++;
				}
			}
			return count;
		}

	}
	
}