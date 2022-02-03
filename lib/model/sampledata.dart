import 'package:wnees_demo/values/image_constants.dart';

class SampleData {
  int? id;
  String? name;
  String? image;
  bool? isSelected;

  SampleData({this.id, this.name, this.image, this.isSelected});
}

List<SampleData> serviceSampleList = [
  SampleData(id: 1, name: "Venue", image: ImageConstants.dummy_cat),
  SampleData(id: 2, name: "People", image: ImageConstants.dummy_cat),
  SampleData(id: 3, name: "Catering", image: ImageConstants.dummy_cat),
  SampleData(id: 4, name: "Entertainer", image: ImageConstants.dummy_cat),
];

List<SampleData> categorySampleList = [
  SampleData(
      id: 1,
      name: "Actor",
      image:
          'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg'),
  SampleData(
      id: 2,
      name: "Musician",
      image:
          'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg'),
  SampleData(
      id: 3,
      name: "Dancer",
      image:
          'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c='),
  SampleData(
      id: 4,
      name: "Magician",
      image:
          'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg'),
  SampleData(
      id: 5,
      name: "Teacher",
      image:
          'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg'),
  SampleData(
      id: 6,
      name: "Technology",
      image:
          'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg'),
];

List<SampleData> subCatSampleList = [
  SampleData(
      id: 1,
      name: "Folk",
      image:
          'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      isSelected: false),
  SampleData(
      id: 2,
      name: "Hip hop",
      image:
          'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      isSelected: false),
  SampleData(
      id: 3,
      name: "Odissi",
      image:
          'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      isSelected: false),
  SampleData(
      id: 4,
      name: "Garba",
      image:
          'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      isSelected: false),
  SampleData(
      id: 5,
      name: "Barfa",
      image:
          'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      isSelected: false),
  SampleData(
      id: 6,
      name: "Kabuki",
      image:
          'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg'),
];

List<SampleData> entertainerSampleList = [
  SampleData(
      id: 1,
      name: "John Doe",
      image:
          'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
      isSelected: false),
  SampleData(
      id: 2,
      name: "Mika singh",
      image:
          'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
      isSelected: false),
  SampleData(
      id: 3,
      name: "Adi manav",
      image:
          'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
      isSelected: false),
  SampleData(
      id: 4,
      name: "Santa",
      image:
          'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
      isSelected: false),
  SampleData(
      id: 5,
      name: "Banta",
      image:
          'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
      isSelected: false),
  SampleData(
      id: 6,
      name: "Chanta",
      image:
          'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg'),
];
