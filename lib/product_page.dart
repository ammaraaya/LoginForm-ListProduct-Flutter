
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final Function logoutCallback;

  ProductPage({required this.logoutCallback});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Map<String, dynamic>> products = [
    {'name': 'Bando 08', 'price': 'Rp 2.000'},
    {'name': 'Bando 2 cagak', 'price': 'Rp 3.000'},
    {'name': 'Bando 20 DN', 'price': 'Rp 1.000'},
    {'name': 'Bando 3 Daun', 'price': 'Rp 2.000'},
    {'name': 'Bando 30', 'price': 'Rp 2.000'},
    {'name': 'Bando 35', 'price': 'Rp 2.000'},
    {'name': 'Bando 47', 'price': 'Rp 3.000'},
    {'name': 'Bando 50', 'price': 'Rp 3.000'},
    {'name': 'Bando 75', 'price': 'Rp 7.000'},
    {'name': 'Bando 10', 'price': 'Rp 8.000'},
  ];

  List<Map<String, dynamic>> filteredProducts = [];
  TextEditingController searchController = TextEditingController();

  _ProductPageState() {
    filteredProducts = List.from(products);
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = List.from(products);
      } else {
        filteredProducts = products
            .where((product) =>
                product['name'].toString().toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 170, 181),
      appBar: AppBar(
        title: Text('Daftar Produk'),
        backgroundColor: Color.fromARGB(255, 179, 111, 124), // warna AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              widget.logoutCallback();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterProducts,
              decoration: InputDecoration(
                labelText: 'Filter Produk',
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), 
                  borderSide: BorderSide.none, 
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(7.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          '${index + 1}.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 8),
                        Text(
                          filteredProducts[index]['name'] as String,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        filteredProducts[index]['price'] as String,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 24, 23, 23),
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 179, 111, 124),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

