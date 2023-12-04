class SuperheroName {
  const SuperheroName({
    required this.name,
    required this.description,
    required this.heroName,
    required this.pathImage,
    required this.rawColor,
  });

  final String name;
  final String heroName;
  final String description;
  final String pathImage;
  final int rawColor;

  static const marvelHeroes = [
    SuperheroName(
        heroName: 'Kunon Buffet',
        name: 'Parker Jenifer',
        description:
            'With more countries landing on the Moon, people back on Earth will have to think about what happens to all the landers, waste and miscellaneous debris left on the lunar surface and in orbit.',
        pathImage: 'assets/img/course1.jpg',
        rawColor: 0xffA41209),
    SuperheroName(
        heroName: 'Iron Man',
        name: 'Tony Stark',
        description:
            'He is the Armored Avenger - driven by a heart that is part machin'
            'e, but all hero! He is the '
            'INVINCIBLE IRON MAN! Iron Man\'s Powers and Abilities: Wears modu'
            'lar arc reactor-powered Iron Man armor, '
            'granting superhuman strength & durability, the ability to fly &'
            ' project Repulsor blasts',
        pathImage: 'assets/img/course3.jpg',
        rawColor: 0xffB3790F),
    SuperheroName(
        heroName: 'Thor',
        name: 'Thor Odinson',
        description:
            'Thor Odinson is the Asgardian God of Thunder, superhero, self-pro'
            'claimed protector of Earth and the king of '
            'Asgard. Thor made a name for himself as the mightiest warrior on '
            'his homeworld and subsequently became well '
            'known for his actions on Earth, which included acting as a found'
            'ing member of the Avengers.',
        pathImage: 'assets/img/course1.jpg',
        rawColor: 0xff3E4953),
    SuperheroName(
        heroName: 'Ant Man',
        name: 'Scott Lang',
        description:
            'Armed with the astonishing ability to shrink in scale but increas'
            'e in strength, con-man Scott Lang must embrace '
            'his inner-hero and help his mentor, Dr. Hank Pym, protect the se'
            'cret behind his spectacular Ant-Man suit '
            'from a new generation of towering threats.',
        pathImage: 'assets/img/course3.jpg',
        rawColor: 0xff98142B),
    SuperheroName(
        heroName: 'Black Widow',
        name: 'Natasha Romanova',
        description:
            'The first and best-known Black Widow is a Russian agent trained'
            ' as a spy, martial artist, and sniper, '
            'and outfitted with an arsenal of high-tech weaponry, including a'
            ' pair of wrist-mounted energy weapons '
            'dubbed her "Widow\'s Bite". She wears no costume during her firs'
            't few appearances but simply evening wear and a veil.',
        pathImage: 'assets/img/course1.jpg',
        rawColor: 0xff011535),
    SuperheroName(
        heroName: 'Captain America',
        name: 'Steve Rogers',
        description:
            'Captain America is the alter ego of Steve Rogers, a frail young '
            'man enhanced to the peak of human perfection '
            'by an experimental serum to aid the United States government\'s'
            ' efforts in World War II. Near the end of the war, '
            'he was trapped in ice and survived in suspended animation until'
            ' he was revived in modern times.',
        pathImage: 'assets/img/course3.jpg',
        rawColor: 0xff0232CB),
    SuperheroName(
        heroName: 'Hawk eye',
        name: 'Clint Barton',
        description:
            'An expert marksman and fighter, Clint Barton puts his talents to '
            'good use by working for S.H.I.E.L.D.'
            ' as a special agent. The archer known as Hawkeye also boasts a '
            'strong moral compass that at times leads '
            'him astray from his direct orders',
        pathImage: 'assets/img/course1.jpg',
        rawColor: 0xff380142),
    SuperheroName(
        heroName: 'Hulk',
        name: 'Bruce Banner',
        description:
            'In his comic book appearances, the character is both the Hulk, a '
            'green-skinned, hulking and muscular '
            'humanoid possessing a vast degree of physical strength, and his '
            'alter ego Dr. Robert Bruce Banner, a '
            'physically weak, socially withdrawn, and emotionally reserved '
            'physicist',
        pathImage: 'assets/img/course3.jpg',
        rawColor: 0xff047A3B),
  ];
}
