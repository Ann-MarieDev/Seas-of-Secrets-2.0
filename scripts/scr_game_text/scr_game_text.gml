// @param text_id
function scr_game_text(_text_id){

switch(_text_id) {
	///TEST--REF TO USAGE OF TEXTBOX SYSTEM
	case "Npc1":
		scr_text("A carrot laying on the ground i owqnder who ius the amont us alroud aisre is this goign to work? im gonna get really asngry if it doesbet please work");
		scr_text("some people should eat more vegtables");
		scr_text("Pick up the carrot?");
			scr_option("Yes", "Npc1-yeah");
			scr_option("No", "Npc1-no");
		break;
		case "Npc1-yeah":
			scr_text("Eww gross*");
			break;
		case "Npc1-no":
			scr_text("I hate veggies...*");
			break;
			
	///TEXT OTHER
	case "Npc2":
		scr_text("Hello :3");
		scr_text("AAAaaaaaaa");
		scr_text("Testing testing 123");
		break;

	case "Npc3":
		scr_text("Hello :3");
		scr_text("AAAaaaaaaa");
		scr_text("Testing testing 123");
		break;
	
	}

}