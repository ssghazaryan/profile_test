import '../models/characteristic.model.dart';
import '../models/reviews_model.dart';
import '../models/user.dart';

class ProfileData {
  bool showAllCharacteristic = false;
  bool sortByDateDown = true;

  final List<Characteristic> mockCharacteristics = [
    const Characteristic(
        id: 1, title: 'Компетентный сотрудник', emoji: '\u{1F4BC}'),
    const Characteristic(id: 2, title: 'Лучший друг', emoji: '\u{1F61C}'),
    const Characteristic(id: 3, title: 'Открытый', emoji: '\u{1F60A}'),
    const Characteristic(id: 4, title: 'Зоошиза', emoji: '\u{1F408}'),
    const Characteristic(
        id: 5, title: 'Ест пиццу с ананасами', emoji: '\u{1F922}'),
    const Characteristic(
        id: 6, title: 'Неадекватный веган', emoji: '\u{1F621}'),
    const Characteristic(id: 7, title: 'Красиво поёт', emoji: '\u{1F3A4}'),
    const Characteristic(id: 8, title: 'Круто одевается', emoji: '\u{1F413}'),
    const Characteristic(id: 9, title: 'Много спит', emoji: '\u{1F634}'),
    const Characteristic(id: 10, title: 'Сплетничает', emoji: '\u{1F3A4}'),
  ];

  User user = User(
    id: 1,
    name: 'Антон Дегтярёв',
    photoUrl: 'assets/image/img.png',
    rating: 8.7,
    characteristics: {
      1: 85,
      2: 29,
      3: 12,
      4: 8,
      5: 1,
      6: 2,
      7: 4,
    },
    reviews: [],
  );
}
