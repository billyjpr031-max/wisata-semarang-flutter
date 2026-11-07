import 'package:flutter/material.dart';

void main() {
  runApp(const WisataSemarangApp());
}

const Color primaryBlue = Color(0xFF3478D4);
const Color darkBlue = Color(0xFF174A86);
const Color lightBlue = Color(0xFFEAF2FF);
const Color backgroundColor = Color(0xFFF6F8FC);
const Color textDark = Color(0xFF202B3C);
const Color textGrey = Color(0xFF8993A3);

class Destination {
  final String name;
  final String category;
  final String description;
  final String location;
  final String hours;
  final String ticket;
  final String imagePath;

  const Destination({
    required this.name,
    required this.category,
    required this.description,
    required this.location,
    required this.hours,
    required this.ticket,
    required this.imagePath,
  });
}

// ======================================================
// 3. DATA DESTINASI WISATA
// ======================================================

final List<Destination> destinations = [
  Destination(
    name: 'Lawang Sewu',
    category: 'Sejarah',
    description:
        'Lawang Sewu merupakan salah satu bangunan '
        'bersejarah yang menjadi ikon Kota Semarang. '
        'Bangunan ini terkenal dengan arsitektur kolonial '
        'yang megah serta memiliki banyak pintu dan jendela. '
        'Tempat ini cocok untuk menikmati wisata sejarah '
        'sekaligus berfoto dengan latar bangunan klasik.',
    location: 'Semarang Tengah',
    hours: 'Cek informasi terbaru',
    ticket: 'Cek tarif terbaru',
    imagePath: 'asset/images/lawang sewu.jpg',
  ),

  Destination(
    name: 'Kota Lama',
    category: 'Sejarah',
    description:
        'Kota Lama Semarang merupakan kawasan bersejarah '
        'yang memiliki bangunan bergaya kolonial. '
        'Kawasan ini sering disebut sebagai Little Netherlands '
        'karena suasana arsitektur klasiknya. Pengunjung '
        'dapat berjalan santai, menikmati suasana kota, '
        'dan mengabadikan berbagai sudut bangunan.',
    location: 'Semarang Utara',
    hours: 'Area kawasan publik',
    ticket: 'Bervariasi sesuai tempat',

    // NAMA FILE SUDAH DIPERBAIKI
    imagePath: 'asset/images/kota_lama.jpg',
  ),

  Destination(
    name: 'Sam Poo Kong',
    category: 'Budaya',
    description:
        'Sam Poo Kong merupakan tempat wisata sejarah '
        'dan budaya yang dikenal dengan bangunan klenteng '
        'berarsitektur khas Tionghoa. Tempat ini memiliki '
        'nilai sejarah yang erat dengan perjalanan '
        'Laksamana Cheng Ho di Semarang.',
    location: 'Semarang Barat',
    hours: 'Cek informasi terbaru',
    ticket: 'Cek tarif terbaru',
    imagePath: 'asset/images/sampokong.jpg',
  ),

  Destination(
    name: 'Gunung Ungaran',
    category: 'Alam',
    description:
        'Gunung Ungaran merupakan destinasi wisata alam '
        'yang menawarkan udara sejuk dan pemandangan '
        'pegunungan. Tempat ini cocok untuk pengunjung '
        'yang menyukai kegiatan alam, pendakian, '
        'dan menikmati suasana jauh dari keramaian kota.',
    location: 'Kabupaten Semarang',
    hours: 'Sesuai jalur pendakian',
    ticket: 'Cek tarif terbaru',
    imagePath: 'asset/images/ungaran.jpg',
  ),

  Destination(
    name: 'Curug Lawe',
    category: 'Alam',
    description:
        'Curug Lawe merupakan wisata air terjun yang '
        'menawarkan pemandangan alam hijau dan suasana '
        'yang menyegarkan. Perjalanan menuju lokasi '
        'menjadi pengalaman tersendiri bagi pengunjung '
        'yang menyukai petualangan alam.',
    location: 'Kabupaten Semarang',
    hours: 'Cek informasi terbaru',
    ticket: 'Cek tarif terbaru',
    imagePath: 'asset/images/curug lawe.jpg',
  ),

  Destination(
    name: 'Curug Lawe Sicepit',
    category: 'Alam',
    description:
        'Curug Lawe Sicepit merupakan destinasi wisata '
        'alam dengan suasana asri dan pemandangan air '
        'terjun yang menarik. Tempat ini dapat menjadi '
        'pilihan untuk menikmati keindahan alam '
        'dan suasana yang lebih tenang.',
    location: 'Kabupaten Semarang',
    hours: 'Cek informasi terbaru',
    ticket: 'Cek tarif terbaru',
    imagePath: 'asset/images/curug lawe sicepit.jpg',
  ),
];

final Set<String> favoriteIds = {};

class WisataSemarangApp extends StatelessWidget {
  const WisataSemarangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wisata Semarang',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: backgroundColor,
        primaryColor: primaryBlue,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
        ),
      ),
      home: const HomePage(),
    );
  }
}

Widget backButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(
      Icons.arrow_back_ios_new,
      size: 20,
      color: textDark,
    ),
  );
}

Widget destinationImage(
  String imagePath, {
  double? height,
  double? width,
  BoxFit fit = BoxFit.cover,
}) {
  return Image.asset(
    imagePath,
    height: height,
    width: width,
    fit: fit,
    errorBuilder: (context, error, stackTrace) {
      return Container(
        height: height,
        width: width,
        color: lightBlue,
        alignment: Alignment.center,
        child: const Icon(
          Icons.image_not_supported_outlined,
          size: 40,
          color: primaryBlue,
        ),
      );
    },
  );
}

Widget bottomNavigation({
  required BuildContext context,
  required int selectedIndex,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 15,
    ),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0x10000000),
          blurRadius: 12,
          offset: Offset(0, -3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        navButton(
          context,
          Icons.home_outlined,
          'Home',
          0,
          selectedIndex,
        ),
        navButton(
          context,
          Icons.favorite_border,
          'Favorit',
          1,
          selectedIndex,
        ),
        navButton(
          context,
          Icons.person_outline,
          'User',
          2,
          selectedIndex,
        ),
      ],
    ),
  );
}

Widget navButton(
  BuildContext context,
  IconData icon,
  String label,
  int index,
  int selectedIndex,
) {
  final bool active = selectedIndex == index;

  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: () {
      if (index == selectedIndex) return;

      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FavoritePage(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserPage(),
          ),
        );
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: active ? primaryBlue : textGrey,
            size: 23,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: active ? primaryBlue : textGrey,
              fontWeight:
                  active ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    ),
  );
}



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchText = '';
  String selectedCategory = 'Semua';

  final List<String> categories = [
    'Semua',
    'Sejarah',
    'Budaya',
    'Alam',
  ];

  void openDetail(Destination destination) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          destination: destination,
        ),
      ),
    ).then((_) {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredDestinations = destinations.where((item) {
      final matchesSearch = item.name
          .toLowerCase()
          .contains(searchText.toLowerCase());

      final matchesCategory =
          selectedCategory == 'Semua' ||
          item.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(
                20,
                20,
                20,
                25,
              ),
              decoration: const BoxDecoration(
                color: primaryBlue,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat Datang 👋',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Jelajah Semarang!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.white24,
                        child: Icon(
                          Icons.explore_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // SEARCH BAR
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchText = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Cari tempat wisata...',
                      hintStyle: const TextStyle(
                        color: textGrey,
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: primaryBlue,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // KONTEN HOME
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(18),
                children: [
                  // KATEGORI
                  const Text(
                    'Kategori Wisata',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 42,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: categories.map((category) {
                        final active =
                            selectedCategory == category;

                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 9),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: active,
                            onSelected: (_) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                            selectedColor: primaryBlue,
                            backgroundColor: Colors.white,
                            side: BorderSide.none,
                            labelStyle: TextStyle(
                              color: active
                                  ? Colors.white
                                  : textDark,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // DESTINASI UNGGULAN
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Destinasi Unggulan',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textDark,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = 'Semua';
                            searchText = '';
                          });
                        },
                        child: const Text(
                          'Lihat semua',
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // KARTU UNGGULAN
                  GestureDetector(
                    onTap: () {
                      openDetail(destinations[0]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.vertical(
                              top: Radius.circular(18),
                            ),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: destinationImage(
                                destinations[0].imagePath,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .spaceBetween,
                                  children: [
                                    const Text(
                                      'PILIHAN POPULER',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: primaryBlue,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: primaryBlue,
                                      size: 19,
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 7),

                                Text(
                                  destinations[0].name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: textDark,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                const Row(
                                  children: [
                                    Icon(
                                      Icons.location_on_outlined,
                                      size: 14,
                                      color: textGrey,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'Semarang Tengah',
                                      style: TextStyle(
                                        color: textGrey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // DAFTAR DESTINASI
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jelajahi Destinasi',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: textDark,
                        ),
                      ),
                      Text(
                        '${filteredDestinations.length} tempat',
                        style: const TextStyle(
                          color: textGrey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 13),

                  if (filteredDestinations.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(30),
                      child: Center(
                        child: Text(
                          'Destinasi tidak ditemukan.',
                          style: TextStyle(color: textGrey),
                        ),
                      ),
                    ),

                  ...filteredDestinations.map((item) {
                    return DestinationCard(
                      destination: item,
                      onTap: () {
                        openDetail(item);
                      },
                      isFavorite:
                          favoriteIds.contains(item.name),
                      onFavoriteTap: () {
                        setState(() {
                          if (favoriteIds.contains(item.name)) {
                            favoriteIds.remove(item.name);
                          } else {
                            favoriteIds.add(item.name);
                          }
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(
        context: context,
        selectedIndex: 0,
      ),
    );
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback onFavoriteTap;

  const DestinationCard({
    super.key,
    required this.destination,
    required this.onTap,
    required this.isFavorite,
    required this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 13),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: destinationImage(
                  destination.imagePath,
                  width: 105,
                  height: 95,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 13),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.category.toUpperCase(),
                      style: const TextStyle(
                        color: primaryBlue,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      destination.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: textDark,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 13,
                          color: textGrey,
                        ),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(
                            destination.location,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: textGrey,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: onFavoriteTap,
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: isFavorite
                      ? Colors.red
                      : textGrey,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  final Destination destination;

  const DetailPage({
    super.key,
    required this.destination,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final item = widget.destination;
    final isFavorite = favoriteIds.contains(item.name);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(18),
          children: [
            // HEADER DETAIL
            Row(
              children: [
                backButton(context),
                const SizedBox(width: 5),
                const Text(
                  'Detail Wisata',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textDark,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (favoriteIds.contains(item.name)) {
                        favoriteIds.remove(item.name);
                      } else {
                        favoriteIds.add(item.name);
                      }
                    });
                  },
                  icon: Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: isFavorite
                        ? Colors.red
                        : textDark,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // FOTO UTAMA
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: AspectRatio(
                aspectRatio: 16 / 10,
                child: destinationImage(
                  item.imagePath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // KATEGORI
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: lightBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  item.category,
                  style: const TextStyle(
                    color: primaryBlue,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              item.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textDark,
              ),
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: primaryBlue,
                  size: 17,
                ),
                const SizedBox(width: 5),
                Text(
                  item.location,
                  style: const TextStyle(
                    fontSize: 12,
                    color: textGrey,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            // INFORMASI WISATA
            const Text(
              'Informasi Wisata',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: textDark,
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: informationCard(
                    Icons.access_time,
                    'Jam Buka',
                    item.hours,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: informationCard(
                    Icons.confirmation_number_outlined,
                    'Tiket Masuk',
                    item.ticket,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 22),

            // DESKRIPSI
            const Text(
              'Tentang Tempat Ini',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: textDark,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              item.description,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 13,
                height: 1.7,
                color: Color(0xFF596477),
              ),
            ),

            const SizedBox(height: 25),

            // TOMBOL GALERI
            SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryPage(
                        destination: item,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.photo_library_outlined,
                ),
                label: const Text(
                  'Lihat Galeri Wisata',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryBlue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigation(
        context: context,
        selectedIndex: -1,
      ),
    );
  }
}

// ======================================================
// 12. KARTU INFORMASI DETAIL
// ======================================================

Widget informationCard(
  IconData icon,
  String title,
  String value,
) {
  return Container(
    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: primaryBlue,
          size: 22,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: textGrey,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            color: textDark,
            fontWeight: FontWeight.bold,
            fontSize: 11,
          ),
        ),
      ],
    ),
  );
}

// ======================================================
// 13. HALAMAN GALERI WISATA
// ======================================================

class GalleryPage extends StatelessWidget {
  final Destination destination;

  const GalleryPage({
    super.key,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: backButton(context),
        title: const Text(
          'Galeri Wisata',
          style: TextStyle(
            color: textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          Text(
            destination.name,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: textDark,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Lihat foto destinasi wisata pilihanmu.',
            style: TextStyle(
              fontSize: 12,
              color: textGrey,
            ),
          ),

          const SizedBox(height: 20),

          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: destinationImage(
              destination.imagePath,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'Foto Destinasi',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: textDark,
            ),
          ),

          const SizedBox(height: 10),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: destinations.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              final item = destinations[index];

              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GalleryPage(
                        destination: item,
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      destinationImage(
                        item.imagePath,
                        fit: BoxFit.cover,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          color: Colors.black54,
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

// ======================================================
// 14. HALAMAN FAVORIT
// ======================================================

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favorites = destinations
        .where((item) => favoriteIds.contains(item.name))
        .toList();

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Wisata Favorit',
          style: TextStyle(
            color: textDark,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),

      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 75,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Belum Ada Wisata Favorit',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Tambahkan tempat wisata yang kamu sukai.',
                    style: TextStyle(
                      fontSize: 12,
                      color: textGrey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(18),
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final item = favorites[index];

                return DestinationCard(
                  destination: item,
                  isFavorite: true,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          destination: item,
                        ),
                      ),
                    ).then((_) {
                      if (mounted) setState(() {});
                    });
                  },
                  onFavoriteTap: () {
                    setState(() {
                      favoriteIds.remove(item.name);
                    });
                  },
                );
              },
            ),

      bottomNavigationBar: bottomNavigation(
        context: context,
        selectedIndex: 1,
      ),
    );
  }
}

// ======================================================
// 15. HALAMAN USER
// ======================================================

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profil Pengguna',
          style: TextStyle(
            color: textDark,
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // KARTU PROFIL
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    color: primaryBlue,
                    size: 48,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  'Ahmad Jazuli Fi Sabililkhoir',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  'NIM: 25670015',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          const Text(
            'Informasi Pengguna',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textDark,
            ),
          ),

          const SizedBox(height: 12),

          userInformation(
            Icons.email_outlined,
            'Email',
            'bili@gmail.com',
          ),

          const SizedBox(height: 10),

          userInformation(
            Icons.phone_outlined,
            'Nomor Telepon',
            '088111228989',
          ),

          const SizedBox(height: 25),

          const Text(
            'Tentang Aplikasi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textDark,
            ),
          ),

          const SizedBox(height: 10),

          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              'Wisata Semarang merupakan aplikasi informasi '
              'destinasi wisata yang membantu pengguna '
              'mengenal berbagai tempat menarik di Semarang '
              'dan sekitarnya. Aplikasi ini menyediakan '
              'informasi tempat wisata, kategori, foto, '
              'serta fitur untuk menyimpan destinasi favorit.',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 12,
                height: 1.7,
                color: Color(0xFF596477),
              ),
            ),
          ),

          const SizedBox(height: 25),

          const Center(
            child: Text(
              'Wisata Semarang App',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryBlue,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: bottomNavigation(
        context: context,
        selectedIndex: 2,
      ),
    );
  }
}

Widget userInformation(
  IconData icon,
  String title,
  String value,
) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: primaryBlue,
          size: 22,
        ),

        const SizedBox(width: 13),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  color: textGrey,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: textDark,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}