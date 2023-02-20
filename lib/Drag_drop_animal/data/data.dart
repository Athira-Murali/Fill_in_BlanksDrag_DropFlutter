enum AnimalType { land, air }

class Animal {
  final String? imageUrl;
  final AnimalType? type;

  Animal({
    this.imageUrl,
    this.type,
  });
}

final allAnimals = [
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/animal1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird1.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird2.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/lion.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird3.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/dog.png',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/bird4.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/elephant.jpg',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/eagle.png',
  ),
  Animal(
    type: AnimalType.land,
    imageUrl: 'assets/zebra.jpg',
  ),
  Animal(
    type: AnimalType.air,
    imageUrl: 'assets/vezhamal.jpg',
  ),
];
