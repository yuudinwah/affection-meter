extension StringExtension on String {
  int modChar() {
    return valueChar() % 2;
  }

  int valueChar() {
    switch (this) {
      case 'A':
        return 65;
      case 'B':
        return 66;
      case 'C':
        return 67;
      case 'D':
        return 68;
      case 'E':
        return 69;
      case 'F':
        return 70;
      case 'G':
        return 71;
      case 'H':
        return 72;
      case 'I':
        return 73;
      case 'J':
        return 74;
      case 'K':
        return 75;
      case 'L':
        return 76;
      case 'M':
        return 77;
      case 'N':
        return 78;
      case 'O':
        return 79;
      case 'P':
        return 80;
      case 'Q':
        return 81;
      case 'R':
        return 82;
      case 'S':
        return 83;
      case 'T':
        return 84;
      case 'U':
        return 85;
      case 'V':
        return 86;
      case 'W':
        return 87;
      case 'X':
        return 88;
      case 'Y':
        return 89;
      case 'Z':
        return 90;
      case 'a':
        return 97;
      case 'b':
        return 98;
      case 'c':
        return 99;
      case 'd':
        return 100;
      case 'e':
        return 101;
      case 'f':
        return 102;
      case 'g':
        return 103;
      case 'h':
        return 104;
      case 'i':
        return 105;
      case 'j':
        return 106;
      case 'k':
        return 107;
      case 'l':
        return 108;
      case 'm':
        return 109;
      case 'n':
        return 110;
      case 'o':
        return 111;
      case 'p':
        return 112;
      case 'q':
        return 113;
      case 'r':
        return 114;
      case 's':
        return 115;
      case 't':
        return 116;
      case 'u':
        return 117;
      case 'v':
        return 118;
      case 'w':
        return 119;
      case 'x':
        return 120;
      case 'y':
        return 121;
      case 'z':
        return 122;
      default:
        return 96;
    }
  }

  double checkAffection(String partnerName) {
    double result = 0.0;
    int length = this.length;
    if (partnerName.length > length) {
      length = partnerName.length;
    }

    List<int> myMod = [];
    List<int> myPartnerMod = [];
    int point = 0;

    for (int i = 0; i < length; i++) {
      String myChar = "";
      String myPartnerChar = "";
      try {
        myChar = this[i];
        myPartnerChar = partnerName[i];
      } catch (e) {
        // 
      }
      int myValue = myChar.valueChar();
      int myPartnerValue = myPartnerChar.valueChar();
      myMod.add(myValue);
      myPartnerMod.add(myPartnerValue);

      if (myValue == myPartnerValue) {
        point++;
      }
    }
    // print("Pointmu $point dari $length");
    result = (point / length * 100);
    return result;
  }
}
