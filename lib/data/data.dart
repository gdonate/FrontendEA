import 'package:registro/models/models.dart';

User currentUser = User(
  id: '',
  username: '',
  password: '',
  email: '',
  // nombre: '',
//   edad: '',
  // descripcion: '',
  imageUrl: '',
  // puntuacion: 0,
  time: 0,
);

final List<User> onlineUsers = [
  User(
    id: 'null',
    username: 'Gabriel',
    password: 'g',
    email: 'gdonate@gmail.com',
    // nombre: 'Gabriel',
    // edad: '24',
    // descripcion: 'Nice job',
    imageUrl: 'https://avatarfiles.alphacoders.com/844/thumb-1920-84463.jpg',
    // puntuacion: 0,
    time: 100,
  ),
  User(
    id: 'null',
    username: 'Axel',
    password: 'axel',
    email: 'axel@gmail.com',
    // nombre: 'Axel',
    // edad: '20',
    // descripcion: 'Brother',
    imageUrl: 'https://avatarfiles.alphacoders.com/265/thumb-1920-265932.jpg',
    // puntuacion: 0,
    time: 50,
  ),
];

final List<Post> posts = [
  Post(
    nameServicio: 'Programación para todos',
    imageServicio: '',
    texto: 'Programación para todas las edades y un profe estupendo',
    fecha: '40m',
    imageUrl:
        'https://s1.qwant.com/thumbr/700x0/8/f/28a074ed4cc4688139678c244d18e354106329a4ed97c7aa756665cf3317e3/programaci%C3%B3n.jpg?u=https%3A%2F%2Fwww.adslzone.net%2Fapp%2Fuploads-adslzone.net%2F2017%2F07%2Fprogramaci%25C3%25B3n.jpg&q=0&b=1&p=0&a=0',
    likes: 10000,
    idServicio: '',
  ),
  Post(
    nameServicio: 'Clases de Guitarra',
    imageServicio: '',
    texto: 'Enseño música pop',
    fecha: '1d',
    imageUrl:
        'https://s1.qwant.com/thumbr/0x380/1/e/3cd09f847896210e465efee4b67a53b9f2fad134c86e17d5c2abd51fe8dd52/maxresdefault.jpg?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2FW2fzA7goOPo%2Fmaxresdefault.jpg&q=0&b=1&p=0&a=0',
    likes: 40,
    idServicio: '',
  ),
  Post(
    nameServicio: 'Clases de Inglés',
    imageServicio: '',
    texto: 'I wish you want to learn with me',
    fecha: '35s',
    imageUrl:
        'https://almomento.mx/wp-content/uploads/2020/03/online-clases-ingles1-750x375.jpg',
    likes: 2,
    idServicio: '',
  ),
];
