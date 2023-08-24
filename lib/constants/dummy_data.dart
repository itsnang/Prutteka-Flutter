class DummyImage {
  final int id;
  final String title;
  final String img;
  DummyImage(this.id, this.title, this.img);
}

List<DummyImage> imageList = [
  DummyImage(1, 'EX',
      'https://www.thaipbsworld.com/wp-content/uploads/2023/03/SEA-games-Cambodia_web.png'),
  DummyImage(2, 'EX',
      'https://ocasia.org/media/cache/55/84/5584b0725e11665fff37fa7285776059.jpg'),
  DummyImage(3, 'EX', 'https://i.ytimg.com/vi/BxQVw8j_3pk/maxresdefault.jpg'),
  DummyImage(4, 'EX',
      'https://www.pattayamail.com/wp-content/uploads/2023/03/t-05-Thailand-requests-Cambodia-to-lower-its-28-million-baht-fee-for-SEA-Games-broadcast-rights.jpg'),
];

class Categories {
  Categories._();
  static List<String> categories = [
    'All',
    'Recently Added',
    'Free',
    'Online',
    'Education',
    'Sport',
    'Music',
    'Exhibtion',
    'Technoloy',
    'Charity',
  ];
}
