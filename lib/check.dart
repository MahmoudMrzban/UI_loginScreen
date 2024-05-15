Map<String , dynamic> Logins={
 "MohamedAli@gmail.com":        "T123",
 "Lolk1596@gmail.com":           "5863",
 "Karim@gmail.com":              "PP88",
 "Amr44@gmail.com":              "AMP998",
};


bool isLoginValid(String Email, String Pass) {
  for (var entry in Logins.entries) {
    if (entry.key == Email && entry.value == Pass) {
      return true; 
    }
  }
  return false; 
}


