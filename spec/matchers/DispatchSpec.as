package matchers {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import org.spectrum.Spec;
	import org.spectrum.events.MatcherEvent;
	import org.spectrum.matchers.*;

	public class DispatchSpec extends Spec {
		
		public function DispatchSpec() {
			describe('without a during block', function():void {
				it('should throw an error', function():void {
					expect(function():void {
						new Dispatch(new EventDispatcher()).run();
					}).to(Throw, Error);
				});
			});
			
			describe('when the given event is dispatched', function():void {
				it('should dispatch TRUE', function():void {
					var dispatcher:EventDispatcher = new EventDispatcher();
					var matcher:Dispatch = new Dispatch(dispatcher, Event.COMPLETE);
					matcher.during(function():void {
						dispatcher.dispatchEvent(new Event(Event.COMPLETE));
					});
					expect(matcher).to(Dispatch, MatcherEvent.TRUE).during(matcher.run);
				});
			});
			
			describe('when the given event is not dispatched', function():void {
				it('should dispatch FALSE', function():void {
					var dispatcher:EventDispatcher = new EventDispatcher();
					var matcher:Dispatch = new Dispatch(dispatcher, Event.COMPLETE);
					matcher.during(function():void {
						dispatcher.dispatchEvent(new Event(Event.SELECT));
					});
					expect(matcher).to(Dispatch, MatcherEvent.FALSE).during(matcher.run);
				});
			});
		}
		
	}
	
}