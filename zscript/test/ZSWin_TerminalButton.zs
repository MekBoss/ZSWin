/*
	ZSWin_TerminalButton.zs
	
	This is a demonstration button that shows how
	to use mouse events.

*/

class TerminalButton : ZButton
{
	// We don't really need to do anything here except
	// override event methods, however you could initialize
	// and define things as needed here as well.

	// Use this to set the button state to active
	override void OnLeftMouseDown()
	{
		// The window's passive GibZoning will set the button's state to
		// highlight if the cursor is on the button and the button isn't
		// blocked by by another window.
		if (self.State == ZButton.highlight)
			self.State = ZButton.active;
	}
	
	// Use this to do the action
	override void OnLeftMouseUp()
	{
		if (self.State == ZButton.active)
		{
			self.State = ZButton.idle;  // reset the button's state, passive gibzoning will reset it
			// You don't have to call ACS, just this example does to deactivate the force field
			// in the demo map.
			self.Text.Text = "Ha ha!";
			CallACS("TerminalTest_ForceFieldDeactivator", 0);
		}
	}
}