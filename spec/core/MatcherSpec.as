package core {
	
	import org.spectrum.Spec;
	import org.spectrum.core.Matcher;
	import org.spectrum.events.MatcherEvent;
	import org.spectrum.matchers.*;

	public class MatcherSpec extends Spec {
		
		public function MatcherSpec() {
			describe('#match', function():void {
				should('throw an error if called', function():void {
					expect(function():void {
						new Matcher(null).match()
					}).to(Throw, Error);
				});
			});
			
			describe('#failureMessage', function():void {
				should('throw an error if called', function():void {
					expect(function():void {
						new Matcher(null).failureMessage(false)
					}).to(Throw, Error);
				});
			});
			
			describe('#run', function():void {
				should('dispatch TRUE if match is successful', function():void {
					var matcher:Matcher = new BeTrue(true);
					expect(matcher).to(Dispatch, MatcherEvent.TRUE).during(function():void {
						matcher.run();
					});
				});
				
				should('dispatch FALSE if match is unsuccessful', function():void {
					var matcher:Matcher = new BeTrue(false);
					expect(matcher).to(Dispatch, MatcherEvent.FALSE).during(function():void {
						matcher.run();
					});
				});
			});
		}
		
	}
	
}