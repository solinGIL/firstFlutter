// i 번째 글자가 자음인지 알려주는 isConsonant() 함수를 완성하시오

class Word {
  String word = '';

  bool isVowel(int i) {
    String vowel =  word.substring(i, i + 1);
    return vowel == 'a' || vowel == 'e' || vowel == 'i' || vowel == 'o' || vowel == 'u';
  }

  bool isConsonant(int i) {
    return !isVowel(i);
  }
}

void main() {
  Word word = Word();
  word.word = 'Flutter';

  int i = 0; // 확인할 i번째 글자

  bool isConsonant = word.isConsonant(i);

  if (isConsonant) {
    print('${word.word[i]} 자음임.');
  } else {
    print('${word.word[i]} 모음임.');
  }
}