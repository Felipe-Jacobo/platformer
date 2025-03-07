function KeysPressed(){
	if ((right && left) || (!right && !left)) return false;
	
	return true;
}