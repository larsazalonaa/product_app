import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    // Data ulasan dummy
    final List<Map<String, dynamic>> reviews = [
      {'ratings': 5, 'comment': 'Mantapp polll!'},
      {'ratings': 4, 'comment': 'Enak banget'},
      {'ratings': 3, 'comment': 'Biasa aja.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(product['name'], style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(58, 66, 86, 1.0), // Warna navbar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk dengan teks nama dan harga di tengah
            Stack(
              children: [
                Image.asset(
                  product['image_url'] ?? 'assets/kwetiau.jpg',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter, // Menempatkan teks di tengah atas
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90.0), // Jarak dari atas
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          product['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Rp ${product['price']}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Deskripsi produk
                  Text(
                    "Deskripsi:",
                    style: TextStyle(fontSize: 16, height: 1.5, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product['description'],
                    style: TextStyle(fontSize: 15, height: 1.5),
                  ),
                  SizedBox(height: 16),
                  // Tombol Add to Cart dengan lebar penuh
                  Center(
                    child: SizedBox(
                      width: double.infinity, // Lebar penuh
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added to Cart!')),
                          );
                        },
                        child: Text('Add to Cart', style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(58, 66, 86, 1.0), // Warna tombol
                          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Ulasan
                  Text(
                    "Reviews:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  reviews.isEmpty
                      ? Text('No reviews yet.')
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: reviews.map((review) {
                            final comment = review['comment'];
                            final ratings = review['ratings'];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.reviews, color: Colors.orange, size: 20), // Ikon bintang
                                      SizedBox(width: 4), // Jarak antara ikon dan teks
                                      Text(
                                        "Rating: $ratings/5",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Comment: $comment",
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
