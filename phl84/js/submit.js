
TrapClicksForHowManySeconds = 2;

AlertBoxMessage = "Um click é suficiente. O servidor está processando... aguarde!\n\n\nClick no botão \"OK\" para voltar.";

PopUpBoxURL = "";
PopUpBoxHeight = 300;
PopUpBoxWidth = 500;

NameOfForm = "formulario";
NameOfSubmitButton = "submitter";
NewTextForSubmitButton = "Processando...";


TrapTime = 0;
DoubleClickTrapperCounter = 0;


function DoubleClickTrapperAction() {
DoubleClickTrapperCounter++;
DoubleClickTrapperButton();
var trapTheClick = false;
if(DoubleClickTrapperCounter > 1 ) { trapTheClick = true; }
if(trapTheClick == true) {
	if(TrapTime == 0) {
		var tDate = new Date;
		TrapTime = tDate.valueOf();
		}
	else {
		var tDate = new Date;
		var localTrapTime = tDate.valueOf();
		if((localTrapTime - TrapTime) > (TrapClicksForHowManySeconds * 1000)) {
			TrapTime = 0;
			trapTheClick = false;
			DoubleClickTrapperCounter = 0;
			}
		}
	}
var valueToReturn = true;
if(trapTheClick == true) {
	valueToReturn = false;
	DoubleClickTrapperPopUp();
	DoubleClickTrapperAlert();
	}
return valueToReturn;
} // end of function DoubleClickTrapperAction()


function DoubleClickTrapperButton() {
var formname   = StripSpaces(NameOfForm);
var submitname = StripSpaces(NameOfSubmitButton);
var newtext    = StripSpaces(NewTextForSubmitButton);
if(formname.length > 0 && submitname.length > 0 && newtext.length > 0) {
	var s = 'document.' + NameOfForm + '.' + NameOfSubmitButton + ".value = '" + NewTextForSubmitButton + "'";
	eval(s);
	}
} // end of function DoubleClickTrapperButton()


function DoubleClickTrapperPopUp() {
var url = StripSpaces(PopUpBoxURL);
if(url.length > 0) {
	if(PopUpBoxHeight < 1) { PopUpBoxHeight = 200; }
	if(PopUpBoxWidth < 1) { PopUpBoxWidth = 300; }
	window.open(url,'',('height=' + PopUpBoxHeight + ',width=' + PopUpBoxWidth + ',resizable=yes,scrollbars=yes'));
	}
} // end of function DoubleClickTrapperPopUp()


function DoubleClickTrapperAlert() {
var message = StripSpaces(AlertBoxMessage);
if(message.length > 0) { alert(AlertBoxMessage); }
} // end of function DoubleClickTrapperAlert()


function StripSpaces(s) {
while(s.indexOf(' ') == 0) { s = s.substr(1); }
return s;
} // end of function StripSpaces()
